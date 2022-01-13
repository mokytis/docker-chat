#!/bin/bash
NAME="local/chat"
version="$1"
dir="./${version}"
dockerfile="${dir}/Dockerfile"

if [ -z "$version" ]; then
  >&2 echo error: please specify a version
  exit
fi

if [[ ! -d "${dir}" ]]; then
  >&2 echo error: cannot find directory "${dir}"
  exit
fi

if [[ ! -f "${dockerfile}" ]]; then
  >&2 echo error: cannot find dockerfile "${dir}"
  exit
fi

docker build "${dir}" -f "${dockerfile}" -t "${NAME}:${version}"
