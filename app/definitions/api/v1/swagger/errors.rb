class Api::V1::Swagger::Errors
  def self.definitions
    {
      error_401: {
        type: 'object',
        properties: {
          error: { type: 'string', example: 'Unauthorized' }
        }
      },
      error_403: {
        type: 'object',
        properties: {
          error: { type: 'string', example: 'Forbidden' }
        }
      },
      error_404: {
        type: 'object',
        properties: {
          error: { type: 'string', example: 'Record not found' }
        }
      },
      error_415: {
        type: 'object',
        properties: {
          errors: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                title: { type: 'string', example: 'Unsupported media type' },
                detail: { type: 'string', example: 'All requests that create or update must use the \'application/vnd.api+json\' Content-Type. This request specified \'application/json\'.' },
                code: { type: 'string', example: 'UNSUPPORTED_MEDIA_TYPE ' },
                status: { type: 'string', example: '415' }
              }
            }
          }
        }
      },
      error_422: {
        type: 'object',
        properties: {
          errors: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                title: { type: 'string', example: 'is already taken ' },
                detail: { type: 'string', example: 'number - is already taken' },
                code: { type: 'string', example: 'VALIDATION_ERROR' }, # may need to be changed/deleted based on config
                source: {
                  type: 'object',
                  properties: {
                    pointer: { type: 'string', example: '/data/attributes/number' }
                  }
                },
                status: { type: 'string', example: '422' }
              }
            }
          }
        }
      }
    }
  end
end
