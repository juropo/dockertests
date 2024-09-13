FROM registry.access.redhat.com/ubi8/python-312

# Ensure we are running as root
USER root

# Update the system and install ca-certificates
RUN dnf update -y && \
    dnf install -y ca-certificates && \
    update-ca-trust && \
    dnf clean all

# Switch back to a non-root user
USER 1001