# PublicData SDK utility: make_context

from projectname_sdk.core.context import PublicDataContext


def make_context_util(ctxmap, basectx):
    return PublicDataContext(ctxmap, basectx)
