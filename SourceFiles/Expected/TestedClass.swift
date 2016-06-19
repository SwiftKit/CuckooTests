import Cuckoo

class MockTestedClass: TestedClass, Cuckoo.Mock {
    let manager: Cuckoo.MockManager<__StubbingProxy_TestedClass, __VerificationProxy_TestedClass> = Cuckoo.MockManager()

    private var observed: TestedClass?

    required override init() {
    }

    required init(spyOn victim: TestedClass) {
        observed = victim
    }

    struct __StubbingProxy_TestedClass: Cuckoo.StubbingProxy {
        let handler: Cuckoo.StubbingHandler
    
        init(handler: Cuckoo.StubbingHandler) {
            self.handler = handler
        }
    }

    struct __VerificationProxy_TestedClass: Cuckoo.VerificationProxy {
        let handler: Cuckoo.VerificationHandler
    
        init(handler: Cuckoo.VerificationHandler) {
            self.handler = handler
        }
    }
}