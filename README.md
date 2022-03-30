# iperf
podman build --layers=false -t iperf .
podman images
podman tag iperf quay.io/wolfgangbrandl/iperf
podman push quay.io/wolfgangbrandl/iperf
oc delete all --all
oc new-app --name iperfclient quay.io/${RHT_OCP4_QUAY_USER}/iperf
skopeo copy --format v2s1 containers-storage:quay.io/${RHT_OCP4_QUAY_USER}/iperf docker://quay.io/${RHT_OCP4_QUAY_USER}/iperf
oc delete all --all
oc new-app --name iperfclient quay.io/${RHT_OCP4_QUAY_USER}/iperf
oc status
oc get pods
oc new-app --name iperfserver quay.io/${RHT_OCP4_QUAY_USER}/iperf

