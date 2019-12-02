#!/usr/bin/env bash

# Copyright 2019 The Knative Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

function cluster_setup() {
  header "Building client"
  ${REPO_ROOT_DIR}/hack/build.sh -f || return 1
}

function knative_setup() {
  local version=${KNATIVE_VERSION:-latest}
  header "Installing Knative serving (${version})"

  if [ "${version}" = "latest" ]; then
    start_latest_knative_serving
  else
    start_release_knative_serving "${version}"
  fi
}