// Generated by the gRPC C++ plugin.
// If you make any local change, they will be lost.
// source: zen_notice.proto

#include "zen_notice.pb.h"
#include "zen_notice.grpc.pb.h"

#include <functional>
#include <grpcpp/impl/codegen/async_stream.h>
#include <grpcpp/impl/codegen/async_unary_call.h>
#include <grpcpp/impl/codegen/channel_interface.h>
#include <grpcpp/impl/codegen/client_unary_call.h>
#include <grpcpp/impl/codegen/client_callback.h>
#include <grpcpp/impl/codegen/method_handler.h>
#include <grpcpp/impl/codegen/rpc_service_method.h>
#include <grpcpp/impl/codegen/server_callback.h>
#include <grpcpp/impl/codegen/service_type.h>
#include <grpcpp/impl/codegen/sync_stream.h>
namespace zen_notice {

static const char* ZenNoticeHandle_method_names[] = {
  "/zen_notice.ZenNoticeHandle/NoticeLine",
  "/zen_notice.ZenNoticeHandle/NoticeDraw",
  "/zen_notice.ZenNoticeHandle/NoticeTrade",
};

std::unique_ptr< ZenNoticeHandle::Stub> ZenNoticeHandle::NewStub(const std::shared_ptr< ::grpc::ChannelInterface>& channel, const ::grpc::StubOptions& options) {
  (void)options;
  std::unique_ptr< ZenNoticeHandle::Stub> stub(new ZenNoticeHandle::Stub(channel));
  return stub;
}

ZenNoticeHandle::Stub::Stub(const std::shared_ptr< ::grpc::ChannelInterface>& channel)
  : channel_(channel), rpcmethod_NoticeLine_(ZenNoticeHandle_method_names[0], ::grpc::internal::RpcMethod::NORMAL_RPC, channel)
  , rpcmethod_NoticeDraw_(ZenNoticeHandle_method_names[1], ::grpc::internal::RpcMethod::NORMAL_RPC, channel)
  , rpcmethod_NoticeTrade_(ZenNoticeHandle_method_names[2], ::grpc::internal::RpcMethod::NORMAL_RPC, channel)
  {}

::grpc::Status ZenNoticeHandle::Stub::NoticeLine(::grpc::ClientContext* context, const ::zen_notice::NoticeLineReq& request, ::zen_notice::NoticeLineRsp* response) {
  return ::grpc::internal::BlockingUnaryCall(channel_.get(), rpcmethod_NoticeLine_, context, request, response);
}

void ZenNoticeHandle::Stub::experimental_async::NoticeLine(::grpc::ClientContext* context, const ::zen_notice::NoticeLineReq* request, ::zen_notice::NoticeLineRsp* response, std::function<void(::grpc::Status)> f) {
  ::grpc_impl::internal::CallbackUnaryCall(stub_->channel_.get(), stub_->rpcmethod_NoticeLine_, context, request, response, std::move(f));
}

void ZenNoticeHandle::Stub::experimental_async::NoticeLine(::grpc::ClientContext* context, const ::grpc::ByteBuffer* request, ::zen_notice::NoticeLineRsp* response, std::function<void(::grpc::Status)> f) {
  ::grpc_impl::internal::CallbackUnaryCall(stub_->channel_.get(), stub_->rpcmethod_NoticeLine_, context, request, response, std::move(f));
}

void ZenNoticeHandle::Stub::experimental_async::NoticeLine(::grpc::ClientContext* context, const ::zen_notice::NoticeLineReq* request, ::zen_notice::NoticeLineRsp* response, ::grpc::experimental::ClientUnaryReactor* reactor) {
  ::grpc_impl::internal::ClientCallbackUnaryFactory::Create(stub_->channel_.get(), stub_->rpcmethod_NoticeLine_, context, request, response, reactor);
}

void ZenNoticeHandle::Stub::experimental_async::NoticeLine(::grpc::ClientContext* context, const ::grpc::ByteBuffer* request, ::zen_notice::NoticeLineRsp* response, ::grpc::experimental::ClientUnaryReactor* reactor) {
  ::grpc_impl::internal::ClientCallbackUnaryFactory::Create(stub_->channel_.get(), stub_->rpcmethod_NoticeLine_, context, request, response, reactor);
}

::grpc::ClientAsyncResponseReader< ::zen_notice::NoticeLineRsp>* ZenNoticeHandle::Stub::AsyncNoticeLineRaw(::grpc::ClientContext* context, const ::zen_notice::NoticeLineReq& request, ::grpc::CompletionQueue* cq) {
  return ::grpc_impl::internal::ClientAsyncResponseReaderFactory< ::zen_notice::NoticeLineRsp>::Create(channel_.get(), cq, rpcmethod_NoticeLine_, context, request, true);
}

::grpc::ClientAsyncResponseReader< ::zen_notice::NoticeLineRsp>* ZenNoticeHandle::Stub::PrepareAsyncNoticeLineRaw(::grpc::ClientContext* context, const ::zen_notice::NoticeLineReq& request, ::grpc::CompletionQueue* cq) {
  return ::grpc_impl::internal::ClientAsyncResponseReaderFactory< ::zen_notice::NoticeLineRsp>::Create(channel_.get(), cq, rpcmethod_NoticeLine_, context, request, false);
}

::grpc::Status ZenNoticeHandle::Stub::NoticeDraw(::grpc::ClientContext* context, const ::zen_notice::NoticeDrawReq& request, ::zen_notice::NoticeDrawRsp* response) {
  return ::grpc::internal::BlockingUnaryCall(channel_.get(), rpcmethod_NoticeDraw_, context, request, response);
}

void ZenNoticeHandle::Stub::experimental_async::NoticeDraw(::grpc::ClientContext* context, const ::zen_notice::NoticeDrawReq* request, ::zen_notice::NoticeDrawRsp* response, std::function<void(::grpc::Status)> f) {
  ::grpc_impl::internal::CallbackUnaryCall(stub_->channel_.get(), stub_->rpcmethod_NoticeDraw_, context, request, response, std::move(f));
}

void ZenNoticeHandle::Stub::experimental_async::NoticeDraw(::grpc::ClientContext* context, const ::grpc::ByteBuffer* request, ::zen_notice::NoticeDrawRsp* response, std::function<void(::grpc::Status)> f) {
  ::grpc_impl::internal::CallbackUnaryCall(stub_->channel_.get(), stub_->rpcmethod_NoticeDraw_, context, request, response, std::move(f));
}

void ZenNoticeHandle::Stub::experimental_async::NoticeDraw(::grpc::ClientContext* context, const ::zen_notice::NoticeDrawReq* request, ::zen_notice::NoticeDrawRsp* response, ::grpc::experimental::ClientUnaryReactor* reactor) {
  ::grpc_impl::internal::ClientCallbackUnaryFactory::Create(stub_->channel_.get(), stub_->rpcmethod_NoticeDraw_, context, request, response, reactor);
}

void ZenNoticeHandle::Stub::experimental_async::NoticeDraw(::grpc::ClientContext* context, const ::grpc::ByteBuffer* request, ::zen_notice::NoticeDrawRsp* response, ::grpc::experimental::ClientUnaryReactor* reactor) {
  ::grpc_impl::internal::ClientCallbackUnaryFactory::Create(stub_->channel_.get(), stub_->rpcmethod_NoticeDraw_, context, request, response, reactor);
}

::grpc::ClientAsyncResponseReader< ::zen_notice::NoticeDrawRsp>* ZenNoticeHandle::Stub::AsyncNoticeDrawRaw(::grpc::ClientContext* context, const ::zen_notice::NoticeDrawReq& request, ::grpc::CompletionQueue* cq) {
  return ::grpc_impl::internal::ClientAsyncResponseReaderFactory< ::zen_notice::NoticeDrawRsp>::Create(channel_.get(), cq, rpcmethod_NoticeDraw_, context, request, true);
}

::grpc::ClientAsyncResponseReader< ::zen_notice::NoticeDrawRsp>* ZenNoticeHandle::Stub::PrepareAsyncNoticeDrawRaw(::grpc::ClientContext* context, const ::zen_notice::NoticeDrawReq& request, ::grpc::CompletionQueue* cq) {
  return ::grpc_impl::internal::ClientAsyncResponseReaderFactory< ::zen_notice::NoticeDrawRsp>::Create(channel_.get(), cq, rpcmethod_NoticeDraw_, context, request, false);
}

::grpc::Status ZenNoticeHandle::Stub::NoticeTrade(::grpc::ClientContext* context, const ::zen_notice::NoticeTradeReq& request, ::zen_notice::NoticeTradeRsp* response) {
  return ::grpc::internal::BlockingUnaryCall(channel_.get(), rpcmethod_NoticeTrade_, context, request, response);
}

void ZenNoticeHandle::Stub::experimental_async::NoticeTrade(::grpc::ClientContext* context, const ::zen_notice::NoticeTradeReq* request, ::zen_notice::NoticeTradeRsp* response, std::function<void(::grpc::Status)> f) {
  ::grpc_impl::internal::CallbackUnaryCall(stub_->channel_.get(), stub_->rpcmethod_NoticeTrade_, context, request, response, std::move(f));
}

void ZenNoticeHandle::Stub::experimental_async::NoticeTrade(::grpc::ClientContext* context, const ::grpc::ByteBuffer* request, ::zen_notice::NoticeTradeRsp* response, std::function<void(::grpc::Status)> f) {
  ::grpc_impl::internal::CallbackUnaryCall(stub_->channel_.get(), stub_->rpcmethod_NoticeTrade_, context, request, response, std::move(f));
}

void ZenNoticeHandle::Stub::experimental_async::NoticeTrade(::grpc::ClientContext* context, const ::zen_notice::NoticeTradeReq* request, ::zen_notice::NoticeTradeRsp* response, ::grpc::experimental::ClientUnaryReactor* reactor) {
  ::grpc_impl::internal::ClientCallbackUnaryFactory::Create(stub_->channel_.get(), stub_->rpcmethod_NoticeTrade_, context, request, response, reactor);
}

void ZenNoticeHandle::Stub::experimental_async::NoticeTrade(::grpc::ClientContext* context, const ::grpc::ByteBuffer* request, ::zen_notice::NoticeTradeRsp* response, ::grpc::experimental::ClientUnaryReactor* reactor) {
  ::grpc_impl::internal::ClientCallbackUnaryFactory::Create(stub_->channel_.get(), stub_->rpcmethod_NoticeTrade_, context, request, response, reactor);
}

::grpc::ClientAsyncResponseReader< ::zen_notice::NoticeTradeRsp>* ZenNoticeHandle::Stub::AsyncNoticeTradeRaw(::grpc::ClientContext* context, const ::zen_notice::NoticeTradeReq& request, ::grpc::CompletionQueue* cq) {
  return ::grpc_impl::internal::ClientAsyncResponseReaderFactory< ::zen_notice::NoticeTradeRsp>::Create(channel_.get(), cq, rpcmethod_NoticeTrade_, context, request, true);
}

::grpc::ClientAsyncResponseReader< ::zen_notice::NoticeTradeRsp>* ZenNoticeHandle::Stub::PrepareAsyncNoticeTradeRaw(::grpc::ClientContext* context, const ::zen_notice::NoticeTradeReq& request, ::grpc::CompletionQueue* cq) {
  return ::grpc_impl::internal::ClientAsyncResponseReaderFactory< ::zen_notice::NoticeTradeRsp>::Create(channel_.get(), cq, rpcmethod_NoticeTrade_, context, request, false);
}

ZenNoticeHandle::Service::Service() {
  AddMethod(new ::grpc::internal::RpcServiceMethod(
      ZenNoticeHandle_method_names[0],
      ::grpc::internal::RpcMethod::NORMAL_RPC,
      new ::grpc::internal::RpcMethodHandler< ZenNoticeHandle::Service, ::zen_notice::NoticeLineReq, ::zen_notice::NoticeLineRsp>(
          std::mem_fn(&ZenNoticeHandle::Service::NoticeLine), this)));
  AddMethod(new ::grpc::internal::RpcServiceMethod(
      ZenNoticeHandle_method_names[1],
      ::grpc::internal::RpcMethod::NORMAL_RPC,
      new ::grpc::internal::RpcMethodHandler< ZenNoticeHandle::Service, ::zen_notice::NoticeDrawReq, ::zen_notice::NoticeDrawRsp>(
          std::mem_fn(&ZenNoticeHandle::Service::NoticeDraw), this)));
  AddMethod(new ::grpc::internal::RpcServiceMethod(
      ZenNoticeHandle_method_names[2],
      ::grpc::internal::RpcMethod::NORMAL_RPC,
      new ::grpc::internal::RpcMethodHandler< ZenNoticeHandle::Service, ::zen_notice::NoticeTradeReq, ::zen_notice::NoticeTradeRsp>(
          std::mem_fn(&ZenNoticeHandle::Service::NoticeTrade), this)));
}

ZenNoticeHandle::Service::~Service() {
}

::grpc::Status ZenNoticeHandle::Service::NoticeLine(::grpc::ServerContext* context, const ::zen_notice::NoticeLineReq* request, ::zen_notice::NoticeLineRsp* response) {
  (void) context;
  (void) request;
  (void) response;
  return ::grpc::Status(::grpc::StatusCode::UNIMPLEMENTED, "");
}

::grpc::Status ZenNoticeHandle::Service::NoticeDraw(::grpc::ServerContext* context, const ::zen_notice::NoticeDrawReq* request, ::zen_notice::NoticeDrawRsp* response) {
  (void) context;
  (void) request;
  (void) response;
  return ::grpc::Status(::grpc::StatusCode::UNIMPLEMENTED, "");
}

::grpc::Status ZenNoticeHandle::Service::NoticeTrade(::grpc::ServerContext* context, const ::zen_notice::NoticeTradeReq* request, ::zen_notice::NoticeTradeRsp* response) {
  (void) context;
  (void) request;
  (void) response;
  return ::grpc::Status(::grpc::StatusCode::UNIMPLEMENTED, "");
}


}  // namespace zen_notice

