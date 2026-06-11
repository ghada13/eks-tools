resource "kubectl_manifest" "certificate_kubeflow_pipelines" {
  yaml_body  = file("${path.root}/kubernetes/helm/cert-manager/manifests/certificate-kubeflow-pipelines.yaml")
  depends_on = [kubectl_manifest.cluster_issuer]
}