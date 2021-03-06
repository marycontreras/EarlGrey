#
#  Copyright 2016 Google Inc.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

require_relative 'spec_helper'

describe 'configure_earlgrey' do
  it 'configures for carthage' do
    diff_project carthage_after, %w[install -t AutoEarlGrey]
    expect(EarlGrey.swift).to eq(true)
    expect(EarlGrey.carthage).to eq(true)
  end

  it 'configures for cocoapods with default swift version' do
    diff_project cocoapods_after, %w[install -t AutoEarlGrey --no-carthage]
    expect(EarlGrey.swift).to eq(true)
    expect(EarlGrey.carthage).to eq(false)
  end

  it 'configures for cocoapods with Swift 2.2' do
    diff_project cocoapods_after,
                 %w[install -t AutoEarlGrey --no-carthage --swift_version=2.2]
    expect(EarlGrey.swift).to eq(true)
    expect(EarlGrey.carthage).to eq(false)
  end

  it 'configures for cocoapods with Swift 3' do
    diff_project cocoapods_after,
                 %w[install -t AutoEarlGrey --no-carthage --swift_version=3.0]
    expect(EarlGrey.swift).to eq(true)
    expect(EarlGrey.carthage).to eq(false)
  end
end
