resource "kubectl_manifest" "gateway_class" {
  yaml_body  = file("${path.root}/kubernetes/manifests/gatewayclass.yaml")
  depends_on = [kubectl_manifest.envoy_proxy, kubectl_manifest.certificate_kubeflow_pipelines]
}

resource "kubectl_manifest" "http_route_kubeflow_pipelines" {
  yaml_body  = file("${path.root}/kubernetes/manifests/kubeflow-pipelines-httproute.yaml")
  depends_on = [kubectl_manifest.gateway_class]
}

resource "kubectl_manifest" "gateway" {
  yaml_body  = file("${path.root}/kubernetes/manifests/gateway.yaml")
  depends_on = [kubectl_manifest.http_route_kubeflow_pipelines, kubectl_manifest.gateway_class]
}