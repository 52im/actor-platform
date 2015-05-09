package im.actor.server.api.rpc.service

import akka.stream.ActorFlowMaterializer
import org.scalatest.concurrent.ScalaFutures
import org.scalatest.time.{ Seconds, Span }
import org.scalatest.{ FlatSpecLike, Matchers }

import im.actor.server.api.ActorSpecHelpers
import im.actor.server.{ KafkaSpec, ServiceSpecMatchers, SqlSpecHelpers }
import im.actor.util.testing._

trait BaseServiceSuite
  extends ActorSuite
  with FlatSpecLike
  with ScalaFutures
  with Matchers
  with ServiceSpecMatchers
  with KafkaSpec
  with SqlSpecHelpers
  with ServiceSpecHelpers
  with ActorSpecHelpers {
  implicit lazy val (ds, db) = migrateAndInitDb()
  implicit val flowMaterializer = ActorFlowMaterializer()

  override implicit def patienceConfig: PatienceConfig =
    new PatienceConfig(timeout = Span(10, Seconds))

  override def afterAll(): Unit = {
    super.afterAll()
    db.close()
    ds.close()
  }
}
