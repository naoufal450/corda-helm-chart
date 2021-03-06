{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}

{{- define "cordapp.name" -}}
{{- default "cordaapp" .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- define "rabbitmq.name" -}}
{{- default "rabbitmq" .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- define "nms.name" -}}
{{- default "nms" .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "bank-operations.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "postgresql.fullname" -}}
{{- printf "%s-%s" .Release.Name "postgresql" | trunc 63 | trimSuffix "-" -}}
{{- end -}} 

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "rabbitmq.fullname" -}}
{{- printf "%s-%s" .Release.Name "rabbitmq" | trunc 63 | trimSuffix "-" -}}
{{- end -}} 

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "keycloak.fullname" -}}
{{- printf "%s-%s" .Release.Name "keycloak" | trunc 63 | trimSuffix "-" -}}
{{- end -}} 

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "bank-operations.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "bank-operations.labels" -}}
helm.sh/chart: {{ include "bank-operations.chart" . }}
{{ include "bank-operations.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "bank-operations.selectorLabels" -}}
app.kubernetes.io/name: {{ include "bank-operations.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "bank-operations.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "bank-operations.fullname" .) .Values.serviceAccount.name }}
{{- else }}


{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


