FROM gentoo/portage:latest as portage
FROM gentoo/stage3-amd64:latest as gentoo
COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo
MAINTAINER samuelololol <samuelololol@gmail.com>
ENV USE="-ipv6"
ENV FEATURES="-sandbox -usersandbox"
RUN echo "*/* PYTHON_TARGETS: python3_6" >> /etc/portage/package.use/python
RUN echo "*/* PYTHON_SINGLE_TARGET: -* python3_6" >> /etc/portage/package.use/python
RUN emerge -uv glibc
