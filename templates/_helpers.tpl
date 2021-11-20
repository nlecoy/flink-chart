{{/*
Construct the base name for all resources in this chart.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "flink.fullname" -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Construct the `labels.app` for used by all resources in this chart.
*/}}
{{- define "flink.labels.app" -}}
{{- printf "%s" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Construct the `labels.chart` for used by all resources in this chart.
*/}}
{{- define "flink.labels.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Define the image configs for flink containers
*/}}
{{- define "flink.image" }}
image: {{ .Values.flink.image.repository }}:{{ .Values.flink.image.tag }}
imagePullPolicy: {{ .Values.flink.image.pullPolicy }}
securityContext:
  runAsUser: {{ .Values.flink.image.uid }}
  runAsGroup: {{ .Values.flink.image.gid }}
{{- end }}
