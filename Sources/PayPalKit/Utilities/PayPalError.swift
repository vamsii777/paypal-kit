import NIO
import NIOHTTP1

struct PayPalError: Error {
    let status: HTTPResponseStatus
    let body: ByteBuffer?
}
