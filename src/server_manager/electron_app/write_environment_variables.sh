#!/bin/bash -eu
#
# Copyright 2020 The Outline Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Writes a dotenv file for CI environment variables.

# Fail if any release variables are undefined.
if [ -z $SENTRY_DSN ]; then
  echo "SENTRY_DSN is undefined."
  exit 1
fi

cat <<EOM > $$BUILD_DIR/server_manager/electron_app/static/.env
SENTRY_DSN=${SENTRY_DSN}
EOM
