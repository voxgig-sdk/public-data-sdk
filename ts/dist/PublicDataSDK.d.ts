import { SlugEntity } from './entity/SlugEntity';
import { StatusEntity } from './entity/StatusEntity';
export type * from './PublicDataTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { PublicDataEntityBase } from './PublicDataEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
type DirectResult = {
    ok: false;
    err: any;
    status?: undefined;
    headers?: undefined;
    data?: undefined;
} | {
    ok: boolean;
    status: number;
    headers: any;
    data: any;
    err?: any;
};
declare class PublicDataSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<DirectResult>;
    _rawRequest(fetchargs?: any): Promise<DirectResult>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    Slug(entopts?: Record<string, any>): SlugEntity;
    Status(entopts?: Record<string, any>): StatusEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): PublicDataSDK;
    tester(testopts?: any, sdkopts?: any): PublicDataSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof PublicDataSDK;
export { stdutil, config, BaseFeature, PublicDataEntityBase, PublicDataSDK, SDK, };
export type { DirectResult };
