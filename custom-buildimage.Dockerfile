FROM registry.access.redhat.com/ubi8/python-312

# Install ca-certificates and necessary tools for updating trust
RUN microdnf update && \
    microdnf install ca-certificates && \
    update-ca-trust && \
    microdnf clean all