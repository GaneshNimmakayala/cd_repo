pipeline {
    agent any

    environment {
        IMAGE_TAG = "${BUILD_NUMBER}" 
    }

    stages {
        stage('Clone Repo') {
            steps {
                git credentialsId: 'github-token', url: 'https://github.com/GaneshNimmakayala/cd_repo.git'

            }
        }

        stage('Update values.yaml') {
            steps {
                sh '''
                    echo "Updating image tag to ${IMAGE_TAG}"
                    yq e '.image.tag = "${IMAGE_TAG}"' -i values.yaml
                    cat values.yaml
                '''
            }
        }

        stage('Commit and Push') {
            steps {
                sh '''
                    git config user.name "GaneshNimmakayala"
                    git config user.email "ganeshnimmakayala6@gmail.com"
                    git add values.yaml
                    git commit -m "ci: update image tag to ${IMAGE_TAG}" || echo "No changes to commit"
                    git push origin ${BRANCH}
                '''
            }
        }

        stage('Done') {
            steps {
                echo '✔️ Values updated and pushed!'
            }
        }
    }
}


