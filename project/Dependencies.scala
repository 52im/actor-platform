package im.actor

import sbt._

object Dependencies {
  object V {
    val akka = "2.3.10"
    val akkaExperimental = "1.0-RC2"
    val scalaz = "7.1.1"
    val slick = "3.0.0"
    val scalatest = "2.2.4"
  }

  object Compile {
    val akkaActor               = "com.typesafe.akka"             %% "akka-actor"                    % V.akka
    val akkaContrib             = "com.typesafe.akka"             %% "akka-contrib"                  % V.akka
    val akkaKernel              = "com.typesafe.akka"             %% "akka-kernel"                   % V.akka
    val akkaStream              = "com.typesafe.akka"             %% "akka-stream-experimental"      % V.akkaExperimental
    val akkaHttp                = "com.typesafe.akka"             %% "akka-http-scala-experimental"  % V.akkaExperimental
    val akkaHttpCore            = "com.typesafe.akka"             %% "akka-http-core-experimental"   % V.akkaExperimental
    val akkaHttpSpray           = "com.typesafe.akka"             %% "akka-http-spray-json-experimental" % V.akkaExperimental
    val akkaSlf4j               = "com.typesafe.akka"             %% "akka-slf4j"                    % V.akka

    val eaioUuid                = "com.eaio.uuid"                 %  "uuid"                          % "3.4"

    val sprayJson               = "io.spray"                      %% "spray-json"                    % "1.3.1"

    val postgresJdbc            = "org.postgresql"                %  "postgresql"                    % "9.4-1200-jdbc41" exclude("org.slf4j", "slf4j-simple")
    val slick                   = "com.typesafe.slick"            %% "slick"                         % V.slick
    val slickJoda               = "com.github.tototoshi"          %% "slick-joda-mapper"             % "1.3.0-SNAPSHOT"
    val flywayCore              = "org.flywaydb"                  %  "flyway-core"                   % "3.1"
    val hikariCP                = "com.zaxxer"                    %  "HikariCP"                      % "2.3.5"

    val amazonaws               = "com.amazonaws"                 %  "aws-java-sdk"                  % "1.9.31"
    val awsWrap                 = "com.github.dwhjames"           %% "aws-wrap"                      % "0.7.2"

    val bcprov                  = "org.bouncycastle"              %  "bcprov-jdk15on"                % "1.50"

    val libPhoneNumber          = "com.googlecode.libphonenumber" % "libphonenumber"                 % "7.0.+"

    val chillAkka               = "com.twitter"                   %% "chill-akka"                    % "0.5.2"
    val chillBijection          = "com.twitter"                   %% "chill-bijection"               % "0.5.2"
    val kryoSerializers         = "de.javakaffee"                 %  "kryo-serializers"              % "0.29"

    val protobuf                = "com.google.protobuf"           %  "protobuf-java"                 % "2.6.1"

    val scodecBits              = "org.scodec"                    %% "scodec-bits"                   % "1.0.5"
    val scodecCore              = "org.scodec"                    %% "scodec-core"                   % "1.7.0"

    val scalazCore              = "org.scalaz"                    %% "scalaz-core"                   % V.scalaz
    val scalazConcurrent        = "org.scalaz"                    %% "scalaz-concurrent"             % V.scalaz

    val shapeless               = "com.chuusai"                   %% "shapeless"                     % "2.1.0"

    val scrImageCore            = "com.sksamuel.scrimage"         %% "scrimage-core"                 % "1.4.2"

    val gcmServer               = "com.google.android.gcm"        %  "gcm-server"                    % "1.0.2"
    val pushy                   = "com.relayrides"                %  "pushy"                         % "0.4.3"

    val logbackClassic          = "ch.qos.logback"                % "logback-classic"                % "1.1.2"
    val scalaLogging            = "com.typesafe.scala-logging"    %% "scala-logging"                 % "3.1.0"

    val jodaTime                = "joda-time"                     %  "joda-time"                     % "2.7"
    val jodaConvert             = "org.joda"                      %  "joda-convert"                  % "1.7"

    val apacheCommonsCodec      = "commons-codec"                 % "commons-codec"                  % "1.10"
    val apacheCommonsIo         = "commons-io"                    % "commons-io"                     % "2.4"
  }

  object Testing {
    val akkaTestkit             = "com.typesafe.akka"             %% "akka-testkit"                  % V.akka % "test,e2e"

    val akkaPersistenceInmem    = "com.github.dnvriend"           %% "akka-persistence-inmemory"     % "1.0.0" % "test,e2e"

    val scalacheck      = "org.scalacheck"                        %% "scalacheck"                    % "1.12.2" % "test"
    val scalatest       = "org.scalatest"                         %% "scalatest"                     % V.scalatest % "test"
    val slickTestkit    = "com.typesafe.slick"                    %% "slick-testkit"                 % V.slick % "test"

    val jfairy          = "io.codearte.jfairy"                    %  "jfairy"                        % "0.3.1" % "test"

    val utilTesting     = "im.actor"                              %% "actor-util-testing"            % "0.0.2" % "test,e2e"
  }

  import Compile._, Testing._

  val shared = Seq(logbackClassic, scalaLogging)

  val root = shared ++ Seq(
    akkaSlf4j, akkaActor, akkaKernel, akkaStream
  )

  val commonsBase = shared ++ Seq(akkaActor, chillAkka, chillBijection, jodaConvert, jodaTime, kryoSerializers)

  val commonsApi = shared ++ Seq(akkaSlf4j, akkaActor, akkaStream, apacheCommonsCodec, protobuf, scalazCore)

  val rpcApi = shared ++ Seq(
    akkaSlf4j, akkaActor, amazonaws, awsWrap, bcprov, apacheCommonsIo, libPhoneNumber, shapeless,
    scrImageCore
  )

  val internalServices = shared ++ Seq(akkaActor, akkaStream, scodecBits)

  val session = shared ++ Seq(
    akkaSlf4j, akkaActor, akkaKernel, akkaStream, scodecCore
  )

  val sessionMessages = Seq(akkaActor)

  val push = shared ++ Seq(akkaContrib, gcmServer, pushy)

  val persist = shared ++ Seq(postgresJdbc, slick, slickJoda, flywayCore, hikariCP, jodaTime, jodaConvert)

  val presences = shared :+ akkaContrib

  val sms = shared ++ Seq(akkaActor, akkaHttp)

  val social = shared :+ akkaContrib

  val codecs = shared ++ Seq(scalazCore, scodecBits, scodecCore)

  val models = shared ++ Seq(eaioUuid, scodecBits, scodecCore, sprayJson, jodaTime, jodaConvert)

  val frontend = shared ++ Seq(
    akkaSlf4j, akkaActor, akkaKernel, akkaStream,
    scodecBits, scodecCore,
    scalazCore, scalazConcurrent
  )

  val tests = shared ++ Seq(
    jfairy, scalacheck, scalatest, slickTestkit, utilTesting, akkaPersistenceInmem,
    akkaTestkit
  )
}
