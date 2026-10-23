import { PublicDataEntityBase } from '../PublicDataEntityBase';
import type { PublicDataSDK } from '../PublicDataSDK';
import type { Control } from '../types';
import type { Slug, SlugListMatch } from '../PublicDataTypes';
declare class SlugEntity extends PublicDataEntityBase<Slug> {
    constructor(client: PublicDataSDK, entopts: any);
    make(this: SlugEntity): SlugEntity;
    list(this: any, reqmatch?: SlugListMatch, ctrl?: Control): Promise<SlugEntity[]>;
}
export { SlugEntity };
