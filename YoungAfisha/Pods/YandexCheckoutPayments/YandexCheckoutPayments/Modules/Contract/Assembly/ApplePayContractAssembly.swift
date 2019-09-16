import UIKit.UIViewController

enum ApplePayContractAssembly {
    static func makeModule(inputData: ApplePayContractModuleInputData,
                           moduleOutput: ApplePayContractModuleOutput?) -> UIViewController {
        let viewController = ContractViewController()
        let presenter = ApplePayContractPresenter(inputData: inputData)

        let authorizationService = AuthorizationProcessingAssembly
            .makeService(isLoggingEnabled: inputData.isLoggingEnabled,
                         testModeSettings: inputData.testModeSettings)
        let analyticsService = AnalyticsProcessingAssembly
            .makeAnalyticsService(isLoggingEnabled: inputData.isLoggingEnabled)
        let analyticsProvider = AnalyticsProvider(authorizationService: authorizationService)
        let interactor = ContractInteractor(analyticsService: analyticsService,
                                            analyticsProvider: analyticsProvider)

        let itemView = ContractViewFactory.makePaymentMethodView(
            paymentMethod: inputData.paymentMethod,
            viewOutput: presenter,
            shouldChangePaymentMethod: inputData.shouldChangePaymentMethod
        )

        viewController.output = presenter
        viewController.paymentMethodView = itemView
        viewController.templateViewController.output = presenter

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.contractView = viewController.templateViewController
        presenter.moduleOutput = moduleOutput
        presenter.paymentMethodView = itemView

        return viewController
    }
}
