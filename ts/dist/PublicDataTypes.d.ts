export interface Slug {
    key?: string;
    label?: string;
    national_count?: number | null;
    national_rank?: number | null;
    unit?: string | null;
    value?: number | string | null;
}
export interface SlugListMatch {
    slug: string;
}
export interface Status {
    checked_at?: string;
    shards?: Record<string, any>;
    status?: string;
}
export interface StatusLoadMatch {
    checked_at?: string;
    shards?: Record<string, any>;
    status?: string;
}
