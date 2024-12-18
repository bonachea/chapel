#!/usr/bin/env bash
#
# Configure environment for performance testing. This should be sourced by other
# scripts that wish to make use of the variables set here.

UTIL_CRON_DIR=$(cd $(dirname ${BASH_SOURCE[0]}) ; pwd)
source $UTIL_CRON_DIR/common.bash
source $UTIL_CRON_DIR/common-fast.bash

# It is tempting to use hostname --short, but macs only support the short form
# of the argument.

if [ -z "${CHPL_TEST_PERF_CONFIG_NAME}" ] ; then
  export CHPL_TEST_PERF_CONFIG_NAME="$(hostname -s)"
fi
if [ -z "${CHPL_TEST_PERF_SUBDIR}" ] ; then
  export CHPL_NIGHTLY_LOGDIR="$PERF_LOGDIR_PREFIX/NightlyPerformance/$CHPL_TEST_PERF_CONFIG_NAME"
else
  export CHPL_NIGHTLY_LOGDIR="$PERF_LOGDIR_PREFIX/NightlyPerformance/$CHPL_TEST_PERF_SUBDIR/$CHPL_TEST_PERF_CONFIG_NAME"
fi
export CHPL_NIGHTLY_CRON_LOGDIR="$CHPL_NIGHTLY_LOGDIR"

export CHPL_TEST_PERF_DIR="$CHPL_NIGHTLY_LOGDIR"
export CHPL_TEST_COMP_PERF_DIR="$CHPL_NIGHTLY_LOGDIR"
