#include <kore/kore.h>
#include <kore/http.h>

int left_pad(char *, size_t, const char *, size_t, char);
int	page(struct http_request *);

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

int page(struct http_request *req)
{
    u_int16_t len;
    char *str;
    char *ch;
    char pad_buffer[1024];
    struct kore_buf *kore_buffer;

    http_populate_get(req);

    kore_buffer = kore_buf_create(128);

    if (!http_argument_get_uint16(req, "len", &len)) {
        len = 0;
    }

    if (!http_argument_get_string(req, "str", &str)) {
        str = "";
    }

    if (!http_argument_get_string(req, "ch", &ch)) {
        ch = " ";
    }

    left_pad(pad_buffer, sizeof(pad_buffer), str, len, *ch);

    kore_buf_appendf(kore_buffer, "{ \"str\": \"%s\"}", pad_buffer);

    http_response_header(req, "content-type", "application/json");
	http_response(req, 200, kore_buffer->data, kore_buffer->offset);
    kore_buf_free(kore_buffer);

	return (KORE_RESULT_OK);
}
