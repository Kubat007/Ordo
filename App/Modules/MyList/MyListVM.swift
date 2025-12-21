final class MyListVM: BaseVM {
    var services: Services!
    var onBackAction: DefaultNavigationCallback?
    
    var favoriteList: [MainModels.Response.Banner] = []
}
