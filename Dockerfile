FROM alpine:latest

RUN apk add py-pip curl && \
 pip install awscli && \
 curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
 curl -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.7/2020-07-08/bin/linux/amd64/aws-iam-authenticator && \
 chmod +x /usr/local/bin/aws-iam-authenticator && \
 chmod +x ./kubectl && \
 mv ./kubectl /usr/bin/kubectl && \
 curl -Lo /usr/local/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && \
 chmod +x /usr/local/bin/jq


COPY entrypoint.sh /entrypoint.sh
COPY green.yaml /green.yaml
COPY blue.yaml /blue.yaml
ENTRYPOINT ["/entrypoint.sh"]
