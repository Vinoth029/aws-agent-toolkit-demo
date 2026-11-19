#!/usr/bin/env bash
# Start Claude Code with the least-privilege AWS profile only.
set -euo pipefail

aws sso logout                       # drop every cached SSO token, admin included
aws sso login --sso-session lab      # log back in with the lab session only
aws sts get-caller-identity --profile agent-dev

mkdir -p ~/aws-agent-lab && cd ~/aws-agent-lab
AWS_PROFILE=agent-dev claude
