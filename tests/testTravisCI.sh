#!/bin/bash -x
#
#  Sample test driver that allows for customizing build/tests based on env vars defined in .travis.yml
#
#      -verbose flag causes unconditional transcript display
#
# Copyright (c) 2013 VMware, Inc. All Rights Reserved <dhenrich@vmware.com>.
#

echo "--->$TRAVIS_BUILD_DIR"
echo "`pwd`"

if [ "${CONFIGURATION}x" = "x" ]; then
  if [ "${BASELINE}x" = "x" ]; then
    echo "Must specify either BASELINE or CONFIGURATION"
    exit 1
  else
    PROJECT_LINE="  baseline: '${BASELINE}';"
    VERSION_LINE=""
    FULL_CONFIG_NAME="BaselineOf${BASELINE}"
  fi
else
  PROJECT_LINE="  configuration: '${CONFIGURATION}';"
  VERSION_LINE="  version: '$VERSION';"
  FULL_CONFIG_NAME="ConfigurationOf${CONFIGURATION}"
fi

if [ "${REPOSITORY}x" = "x" ]; then
  echo "Must specify REPOSITORY"
  exit 1
fi
REPOSITORY_LINE="  repository: '$REPOSITORY';"

OUTPUT_PATH="${PROJECT_HOME}/tests/travisCI.st"

cat - >> $OUTPUT_PATH << EOF
"Load and run tests to be performed by TravisCI"
Transcript cr; show: 'travis---->travisCI.st'.

"Pharo and Squeak tests"
(Smalltalk includesKey: #GsFile) ifFalse:[
"Load the ConfigurationOfSeaside3 as well to make the packageValidityTest work"
Metacello new
    configuration: 'Seaside3';
    repository: 'filetree://${TRAVIS_BUILD_DIR}/repository';
    get.
 "Load the configuration or baseline"
 Metacello new
 $PROJECT_LINE
 $VERSION_LINE
 $REPOSITORY_LINE
   load: #( ${LOADS} ).
  "Run the tests"
  Smalltalk at: #Author ifPresent:[(Smalltalk at: #Author) fullName: 'Travis'].
  ((Smalltalk includesKey: #Utilities) and:[(Smalltalk at: #Utilities) respondsTo: #setAuthorInitials:]) ifTrue:[(Smalltalk at: #Utilities) setAuthorInitials: 'TCI'].
  TravisCIHarness
    value: #( '${FULL_CONFIG_NAME}' )
    value: 'TravisCISuccess.txt' 
    value: 'TravisCIFailure.txt'.
].

"Gemstone tests"
(Smalltalk includesKey: #GsFile) ifTrue:[
"Upgrade Grease and Metacello"
Gofer new
  package: 'GsUpgrader-Core';
  url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
  load.
(Smalltalk at: #GsUpgrader) upgradeGrease.

(Smalltalk at: #GsDeployer) deploy: [
  "Load the configuration or baseline"
  Metacello new
    $PROJECT_LINE
    $VERSION_LINE
    $REPOSITORY_LINE
    onLock: [:ex | ex honor];
    load: #( ${LOADS} )
].

true ifTrue: [
  "Run all tests in image"
   TravisCISuiteHarness
     value: TestCase suite
     value: 'TravisCISuccess.txt'
     value: 'TravisCIFailure.txt'.
] ifFalse: [
  "Run just the Seaside tests"
  TravisCIHarness
    value: #( '${FULL_CONFIG_NAME}' )
    value: 'TravisCISuccess.txt' 
    value: 'TravisCIFailure.txt' ].
]
EOF

cat $OUTPUT_PATH

$BUILDER_CI_HOME/testTravisCI.sh "$@"
if [[ $? != 0 ]] ; then exit 1; fi
