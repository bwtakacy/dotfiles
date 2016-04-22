# Hadoop key コマンドが失敗する

java.net.ConnectException: 接続を拒否されました
        at java.net.PlainSocketImpl.socketConnect(Native Method)
        at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:350)
        at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)
        at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)
        at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)
        at java.net.Socket.connect(Socket.java:589)
        at sun.net.NetworkClient.doConnect(NetworkClient.java:175)
        at sun.net.www.http.HttpClient.openServer(HttpClient.java:432)
        at sun.net.www.http.HttpClient.openServer(HttpClient.java:527)
        at sun.net.www.http.HttpClient.<init>(HttpClient.java:211)
        at sun.net.www.http.HttpClient.New(HttpClient.java:308)
        at sun.net.www.http.HttpClient.New(HttpClient.java:326)
        at sun.net.www.protocol.http.HttpURLConnection.getNewHttpClient(HttpURLConnection.java:1169)
        at sun.net.www.protocol.http.HttpURLConnection.plainConnect0(HttpURLConnection.java:1105)
        at sun.net.www.protocol.http.HttpURLConnection.plainConnect(HttpURLConnection.java:999)
        at sun.net.www.protocol.http.HttpURLConnection.connect(HttpURLConnection.java:933)
        at org.apache.hadoop.security.authentication.client.KerberosAuthenticator.authenticate(KerberosAuthenticator.java:188)
        at org.apache.hadoop.security.token.delegation.web.DelegationTokenAuthenticator.authenticate(DelegationTokenAuthenticator.java:128)
        at org.apache.hadoop.security.authentication.client.AuthenticatedURL.openConnection(AuthenticatedURL.java:216)
        at org.apache.hadoop.security.token.delegation.web.DelegationTokenAuthenticatedURL.openConnection(DelegationTokenAuthenticatedURL.java:322)
        at org.apache.hadoop.crypto.key.kms.KMSClientProvider$1.run(KMSClientProvider.java:495)
        at org.apache.hadoop.crypto.key.kms.KMSClientProvider$1.run(KMSClientProvider.java:490)
        at java.security.AccessController.doPrivileged(Native Method)
        at javax.security.auth.Subject.doAs(Subject.java:422)
        at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1742)
        at org.apache.hadoop.crypto.key.kms.KMSClientProvider.createConnection(KMSClientProvider.java:490)
        at org.apache.hadoop.crypto.key.kms.KMSClientProvider.createKeyInternal(KMSClientProvider.java:685)
        at org.apache.hadoop.crypto.key.kms.KMSClientProvider.createKey(KMSClientProvider.java:695)
        at org.apache.hadoop.crypto.key.KeyShell$CreateCommand.execute(KeyShell.java:483)
        at org.apache.hadoop.crypto.key.KeyShell.run(KeyShell.java:79)
        at org.apache.hadoop.util.ToolRunner.run(ToolRunner.java:76)
        at org.apache.hadoop.crypto.key.KeyShell.main(KeyShell.java:515)

Kerberos認証の設定をしていないのにKerberos認証を行っている？

## 原因
KMSのLISTENポートが16000から9600に変更されたため。
