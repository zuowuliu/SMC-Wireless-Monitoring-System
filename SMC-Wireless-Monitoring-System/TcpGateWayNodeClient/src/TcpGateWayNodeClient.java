import io.netty.bootstrap.Bootstrap;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.string.StringDecoder;
import io.netty.handler.codec.string.StringEncoder;
import io.netty.util.CharsetUtil;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.InputStreamReader;

public class TcpGateWayNodeClient {
    public static void main(String[] args) {
        EventLoopGroup group = new NioEventLoopGroup();
        Bootstrap bootstrap = new Bootstrap();
        bootstrap.group(group).channel(NioSocketChannel.class).handler(new ChannelInitializer<SocketChannel>() {
            @Override
            protected void initChannel(SocketChannel socketChannel) throws Exception {
                ChannelPipeline channelPipeline = socketChannel.pipeline();
                // 往pipeline中添加一个解码器
                channelPipeline.addLast("Decoder", new StringDecoder());
                // 往pipeline中添加Server的业务处理类
                channelPipeline.addLast(new TcpGateWayNodeClientHandler());
                // 往pipeline中添加一个编码器
                channelPipeline.addLast("Encoder", new StringEncoder());
            }
        });
        try {
            ChannelFuture channelFuture = bootstrap.connect("127.0.0.1", 9090);
            Channel currentChannel = channelFuture.channel();
            System.out.println("Client is Ready...");
            FileInputStream fileInputStream = new FileInputStream("C:/Users/Administrator/Desktop/NodeMessage1.txt");
            DataInputStream dataInputStream = new DataInputStream(fileInputStream);
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(dataInputStream));
            String msg = bufferedReader.readLine();
            //System.out.println(msg);
            // 将从txt文件中读取到的数据通过ByteBuf的形式传给服务端
            ByteBuf buf = Unpooled.copiedBuffer(msg, CharsetUtil.UTF_8);
            currentChannel.writeAndFlush(buf);
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
    }
}
