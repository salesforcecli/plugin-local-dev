/*
 * Copyright (c) 2024, salesforce.com, inc.
 * All rights reserved.
 * Licensed under the BSD 3-Clause license.
 * For full license text, see LICENSE.txt file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */

import { TestContext } from '@salesforce/core/testSetup';
import { expect } from 'chai';
import { DevServerUtils } from '../../src/shared/devServerUtils.js';
// import { AuthInfo, Connection } from '@salesforce/core';
// import { OrgUtils } from '../../src/shared/orgUtils.js';

describe('lightning preview app', () => {
  const $$ = new TestContext();

  afterEach(() => {
    $$.restore();
  });

  it('getAppId returns undefined when no matches found', async () => {
    $$.SANDBOX.stub(process, 'cwd').resolves('\\Users\\joe\\desktop');
    const configFileLocation = DevServerUtils.getServerConfigFileLocation();
    expect(configFileLocation).to.be.equal('\\Users\\joe\\desktop\\lwr.config.json');
    // $$.SANDBOX.stub(Connection.prototype, 'query').resolves({ records: [], done: true, totalSize: 0 });
    // const appId = await OrgUtils.getAppId(new Connection({ authInfo: new AuthInfo() }), 'blah');
    // expect(appId).to.be.undefined;
  });

  // it('getAppId returns first match when multiple matches found', async () => {
  //   $$.SANDBOX.stub(Connection.prototype, 'query').resolves({
  //     records: [{ DurableId: 'id1' }, { DurableId: 'id2' }],
  //     done: true,
  //     totalSize: 2,
  //   });
  //   const appId = await OrgUtils.getAppId(new Connection({ authInfo: new AuthInfo() }), 'Sales');
  //   expect(appId).to.be.equal('id1');
  // });

  // it('getAppId uses Label if DeveloperName produces no matches', async () => {
  //   const noMatches = { records: [], done: true, totalSize: 0 };
  //   const matches = { records: [{ DurableId: 'id1' }, { DurableId: 'id2' }], done: true, totalSize: 2 };
  //   const stub = $$.SANDBOX.stub(Connection.prototype, 'query')
  //     .onFirstCall()
  //     .resolves(noMatches)
  //     .onSecondCall()
  //     .resolves(matches);
  //   const appId = await OrgUtils.getAppId(new Connection({ authInfo: new AuthInfo() }), 'Sales');
  //   expect(appId).to.be.equal('id1');
  //   expect(stub.getCall(0).args[0]).to.include('DeveloperName');
  //   expect(stub.getCall(1).args[0]).to.include('Label');
  // });
});
