FROM python:3.8.3-alpine3.10
COPY --from=hashicorp/terraform:1.4.6 /bin/terraform /bin/terraform
COPY --from=hashicorp/packer:1.8.6 /bin/packer /bin/packer

RUN apk add --update git bash wget groff less jq perl openssh make ca-certificates curl \
    #ansible reqs.
    gcc python-dev libffi-dev musl-dev linux-headers libressl-dev

RUN pip install --upgrade pip
RUN pip install --quiet awscli==1.16.144 ansible==2.7.10

CMD ["/bin/bash"]