FROM registry.access.redhat.com/ubi8/python-312

# Update the system and install ca-certificates
RUN dnf update -y && \
    dnf install -y ca-certificates && \
    update-ca-trust && \
    dnf clean all