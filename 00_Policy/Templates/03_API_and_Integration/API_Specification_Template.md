# API SPECIFICATION

## Document Control
| Field | Value |
|-------|-------|
| **API Name** | [Name] |
| **Version** | 1.0.0 |
| **Owner** | [Team/Name] |
| **Base URL** | https://api.example.com/v1 |
| **Date** | [YYYY-MM-DD] |

---

## 1. OVERVIEW

**Purpose:** [Brief description of API purpose]

**API Type:** [ ] REST [ ] GraphQL [ ] gRPC [ ] SOAP

**Authentication:** [ ] OAuth 2.0 [ ] JWT [ ] API Key [ ] Basic Auth

**Rate Limiting:** [X requests per minute/hour]

---

## 2. AUTHENTICATION

### OAuth 2.0 Flow
```
POST /oauth/token
Content-Type: application/x-www-form-urlencoded

grant_type=client_credentials
&client_id=YOUR_CLIENT_ID
&client_secret=YOUR_CLIENT_SECRET
```

**Response:**
```json
{
  "access_token": "eyJhbGc...",
  "token_type": "Bearer",
  "expires_in": 3600
}
```

**Usage:**
```
Authorization: Bearer {access_token}
```

---

## 3. ENDPOINTS

### 3.1 GET /users
**Description:** Retrieve list of users

**Query Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| page | integer | No | Page number (default: 1) |
| limit | integer | No | Items per page (default: 20, max: 100) |
| sort | string | No | Sort field (e.g., "created_at") |
| order | string | No | Sort order ("asc" or "desc") |

**Request Example:**
```bash
curl -X GET "https://api.example.com/v1/users?page=1&limit=20" \
  -H "Authorization: Bearer {token}"
```

**Response (200 OK):**
```json
{
  "data": [
    {
      "id": "usr_123",
      "name": "John Doe",
      "email": "john@example.com",
      "created_at": "2025-01-01T00:00:00Z"
    }
  ],
  "meta": {
    "page": 1,
    "limit": 20,
    "total": 100
  }
}
```

**Error Responses:**
- `401 Unauthorized` - Invalid or missing token
- `403 Forbidden` - Insufficient permissions
- `429 Too Many Requests` - Rate limit exceeded

---

### 3.2 POST /users
**Description:** Create a new user

**Request Body:**
```json
{
  "name": "Jane Doe",
  "email": "jane@example.com",
  "role": "user"
}
```

**Validation Rules:**
- `name`: Required, string, 2-100 characters
- `email`: Required, valid email format, unique
- `role`: Optional, enum ["user", "admin"]

**Response (201 Created):**
```json
{
  "id": "usr_124",
  "name": "Jane Doe",
  "email": "jane@example.com",
  "role": "user",
  "created_at": "2025-01-01T00:00:00Z"
}
```

**Error Responses:**
- `400 Bad Request` - Validation error
- `409 Conflict` - Email already exists

---

### 3.3 GET /users/{id}
**Description:** Retrieve a specific user

**Path Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| id | string | User ID |

**Response (200 OK):**
```json
{
  "id": "usr_123",
  "name": "John Doe",
  "email": "john@example.com",
  "role": "admin",
  "created_at": "2025-01-01T00:00:00Z",
  "updated_at": "2025-01-02T00:00:00Z"
}
```

**Error Responses:**
- `404 Not Found` - User does not exist

---

### 3.4 PUT /users/{id}
**Description:** Update a user

**Request Body:**
```json
{
  "name": "John Updated",
  "email": "john.updated@example.com"
}
```

**Response (200 OK):** [Updated user object]

---

### 3.5 DELETE /users/{id}
**Description:** Delete a user

**Response (204 No Content)**

---

## 4. ERROR HANDLING

### Standard Error Response
```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid request parameters",
    "details": [
      {
        "field": "email",
        "message": "Email format is invalid"
      }
    ],
    "request_id": "req_xyz123"
  }
}
```

### Error Codes
| HTTP Status | Code | Description |
|-------------|------|-------------|
| 400 | VALIDATION_ERROR | Invalid input |
| 401 | UNAUTHORIZED | Missing/invalid token |
| 403 | FORBIDDEN | Insufficient permissions |
| 404 | NOT_FOUND | Resource not found |
| 429 | RATE_LIMIT_EXCEEDED | Too many requests |
| 500 | INTERNAL_ERROR | Server error |

---

## 5. RATE LIMITING

**Limits:**
- 1000 requests per hour per API key
- 10 requests per second burst

**Headers:**
```
X-Rate-Limit-Limit: 1000
X-Rate-Limit-Remaining: 999
X-Rate-Limit-Reset: 1609459200
```

**429 Response:**
```json
{
  "error": {
    "code": "RATE_LIMIT_EXCEEDED",
    "message": "Rate limit exceeded. Retry after 3600 seconds."
  }
}
```

---

## 6. VERSIONING

**Strategy:** URL path versioning

**Format:** `https://api.example.com/v{major}/endpoint`

**Deprecation Policy:**
- 6 months notice before deprecation
- Support minimum 2 versions
- Sunset header in responses

---

## 7. PAGINATION

**Cursor-based pagination:**
```json
{
  "data": [...],
  "pagination": {
    "next_cursor": "eyJpZCI6MTB9",
    "prev_cursor": null,
    "has_more": true
  }
}
```

---

## 8. WEBHOOKS

**Events:**
- `user.created`
- `user.updated`
- `user.deleted`

**Payload:**
```json
{
  "event": "user.created",
  "data": {...},
  "timestamp": "2025-01-01T00:00:00Z"
}
```

---

## 9. SDKs & LIBRARIES

- JavaScript/TypeScript: [npm package]
- Python: [pip package]
- Java: [maven coordinates]

---

## 10. CHANGELOG

### Version 1.0.0 (2025-01-01)
- Initial API release
- User CRUD operations

**Template Version:** 1.0.0
