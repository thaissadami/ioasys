import Swinject
import Networking
import OxeNetworking
import Alamofire
import Moya
import AppData

class NetworkingAssembly: Assembly {

    private let environment: Environment

    init(environment: Environment) {
        self.environment = environment
    }

    func assemble(container: Container) {

        container.autoregister(UserSessionRequestHandler.self, initializer: UserSessionRequestHandler.init)
            .implements(ResultHandler.self, RequestInterceptor.self, ErrorFilter.self)

        container.register(Environment.self) { _ in self.environment }
        container.autoregister(Dispatcher.self, initializer: CommonMoyaDispatcher.init)
        container.autoregister(AppData.AuthRemoteDataSourceProtocol.self, initializer: Networking.AuthRemoteDataSource.init)
        container.autoregister(AppData.EnterprisesRemoteDataSourceProtocol.self, initializer: Networking.EnterprisesRemoteDataSource.init)
    }

}
