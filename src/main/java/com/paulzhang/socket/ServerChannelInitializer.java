package com.paulzhang.socket;

import io.netty.channel.ChannelInitializer;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.codec.bytes.ByteArrayDecoder;
import io.netty.handler.codec.bytes.ByteArrayEncoder;

public class ServerChannelInitializer extends ChannelInitializer<SocketChannel> {

    @Override
    protected void initChannel(SocketChannel socketChannel) throws Exception {
        //添加编解码
        socketChannel.pipeline().addLast("decoder", new ByteArrayDecoder());
        socketChannel.pipeline().addLast("encoder", new ByteArrayEncoder());
        socketChannel.pipeline().addLast(new NettyServerHandler());
    }
}
