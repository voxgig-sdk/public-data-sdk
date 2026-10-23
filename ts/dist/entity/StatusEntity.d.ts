import { PublicDataEntityBase } from '../PublicDataEntityBase';
import type { PublicDataSDK } from '../PublicDataSDK';
import type { Control } from '../types';
import type { Status, StatusLoadMatch } from '../PublicDataTypes';
declare class StatusEntity extends PublicDataEntityBase<Status> {
    constructor(client: PublicDataSDK, entopts: any);
    make(this: StatusEntity): StatusEntity;
    load(this: any, reqmatch?: StatusLoadMatch, ctrl?: Control): Promise<StatusEntity>;
}
export { StatusEntity };
