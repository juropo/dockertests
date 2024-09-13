FROM registry.access.redhat.com/ubi8/python-312

# Ensure we are running as root
USER root

# Update the system and install ca-certificates
RUN dnf update -y && \
    dnf install -y ca-certificates && \
    update-ca-trust && \
    dnf clean all

# If necessary, switch back to a non-root user (if your app requires it)
USER 1001