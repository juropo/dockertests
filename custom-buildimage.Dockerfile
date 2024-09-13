FROM registry.access.redhat.com/ubi8/python-312

# Install ca-certificates package
RUN yum update -y && yum install -y ca-certificates && update-ca-trust
