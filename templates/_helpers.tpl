{{- define "deployment.fullname" -}}
{{ .Release.Name }}-app
{{- end }}

{{- define "deployment.labels" -}}
app: {{ .Release.Name }}
{{- end }}
