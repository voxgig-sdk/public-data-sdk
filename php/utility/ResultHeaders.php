<?php
declare(strict_types=1);

// PublicData SDK utility: result_headers

class PublicDataResultHeaders
{
    public static function call(PublicDataContext $ctx): ?PublicDataResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
