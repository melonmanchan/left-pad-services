#include <kore/kore.h>
#include <kore/http.h>

int left_pad(char *buffer, size_t buflen, const char *in, size_t length, char padding)
{
    size_t in_len = strlen(in);
    size_t pad = 0;

    if (length + 1 > buflen || in_len + 1 > buflen)
        return 0;
    if (length > in_len) {
            pad = length;
            memset(buffer, padding, pad);
        }

    memcpy(buffer + pad, in, in_len);
    buffer[in_len + pad] = '\0';
    return 1;
}

int		page(struct http_request *);

int page(struct http_request *req)
{

    u_int16_t len;
    char *str;
    char *ch;
    char buffer[1024];

    struct kore_buf *buf;
    http_populate_get(req);

    buf = kore_buf_create(128);

    if (http_argument_get_uint16(req, "len", &len)) {
        //kore_buf_appendf(buf, "len uint: %d\n", len);
    }

    if (http_argument_get_string(req, "str", &str)) {
        //kore_buf_appendf(buf, "str : %s\n", str);
    }

    if (http_argument_get_string(req, "ch", &ch)) {
        //kore_buf_appendf(buf, "ch : %s\n", ch);
    }

    left_pad(buffer, sizeof(buffer), str, len, *ch);

    kore_buf_appendf(buf, "{ \"str\": \"%s\"}", buffer);

    http_response_header(req, "content-type", "application/json");
	http_response(req, 200, buf->data, buf->offset);
    kore_buf_free(buf);

	return (KORE_RESULT_OK);
}
