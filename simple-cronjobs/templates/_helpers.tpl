{{- define "cronjob.name" -}}
{{- $name := (printf "%s-migration" .Release.Name) -}}
{{ .Values.fullnameOverride | default $name | trunc 63 | trimSuffix "-"}}
{{- end -}}

{{- define "cronjob.labels" -}}
app: {{ .Release.Name }}
chart-name: {{ .Chart.Name }}
chart-version: {{ .Chart.Version }}
{{- with .Values.global.labels }}
{{- toYaml . | nindent 0 }}
{{- end -}}
{{- end -}}