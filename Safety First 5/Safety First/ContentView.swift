//
//  ContentView.swift
//  Safety First
//
//  Created by Farzana

import SwiftUI
import Network


public class FavoritePages: ObservableObject {
    static let favorite = FavoritePages()
    public var pages: [String] = []
    func markAsFavorite(pageTitle: String) {
  if !pages.contains(pageTitle) {
            pages.append(pageTitle)
 }
    }
}




struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    Image("welcome")
                        .resizable()
                        .frame(width: 400, height: 700)
                    Text("Leave a little sparkle wherever you go..")
                        .frame(width: 400, height: 50)
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 4/100, green: 18/100, blue: 31/100))
                        .padding()
                }

                
            }
            .background(Color(red: 240, green:211, blue: 239))
        }
    }
}



struct TransportationView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    Rectangle()
                        .fill(Color.blue)
                    Text ("Categories")
                        .bold()
                        .font(.system(size: 25))
                        .foregroundColor(Color(red: 4/100, green: 18/100, blue: 31/100))
                    Text("Find the finest products with just one click!")
                        .padding()
                        .foregroundColor(Color(red: 4/100, green: 18/100, blue: 31/100))
                        .frame(height:20)
                    
                    
                    Image("men")
                        .resizable()
                        .frame(width: 300, height: 200)
                        .padding()
                    
                    Button("Men") {
                        Router.shared.selectedTab = 3
                    }
                      
                    
                    
                    Image("women")
                        .resizable()
                        .frame(width: 300, height: 200)
                        .padding()
                    Button("Women") {
                        Router.shared.selectedTab = 2
                    }
                    
                    Image("kids")
                        .resizable()
                        .frame(width: 300, height: 200)
                        .padding()
                    Button("Kids") {
                        Router.shared.selectedTab = 4
                    }
                    
                 
                    
                }
                .background(Color(red: 217/100, green: 242/100, blue: 255/100))
            }
                .navigationTitle("Home")
            
        
        }
    }
}

struct WomenView: View {
    @ObservedObject var favoritePages = FavoritePages()
    @State  var showNetworkAlert = true
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                  
                    Rectangle()
                        .fill(Color.blue)
                    Text ("Trendy. Timeless. Yours")
                        .bold()
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 4/100, green: 18/100, blue: 31/100))
                    Text ("\nRedefine elegance and express yourself ")
                        .font(.system(size: 15))
                        .foregroundColor(Color(red: 4/100, green: 18/100, blue: 31/100))
                        .padding(.bottom)
                    
                    Text ("Jewellery")
                        .bold()
                        .frame(width: 200, height:20)
                        .font(.system(size: 20))
                        .padding(.top)

                    
                    
                    HStack{
                        VStack{
                            Image("kay")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 10)
                                .padding()
                            HStack{
                                Link("Kay Jewelers", destination: URL(string: "https://www.kay.com/?cid=SEM-goo-site:kay.com%20kay%20jewelers-Ecomm%20-%20Brand%20-%20Core&gad_source=1&gclid=EAIaIQobChMI96vJka3PiAMVGEb_AR2dWTi_EAAYASAAEgIP7fD_BwE&gclsrc=aw.ds")!)
                              
                                .onChange(of: Monitor().status){
                                    connection in
                                    showNetworkAlert = connection.self.rawValue.isEmpty
                                }
                                .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Kay Jewelers")
                                }) {
                                    Image(systemName: "heart")
                                }
                                
                            
                            }
                            
                        }
                        
                        VStack{
                            Image("tiffany&co")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 10)
                                .padding()
                            HStack{
                                Link("Tiffany&Co.", destination: URL(string: "https://www.tiffany.com/")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Tiffany&Co")
                                }) {
                                    Image(systemName: "heart")
                                }

                            }
                            
                        }
                        VStack{
                            Image("jared")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 10)
                                .padding()
                            HStack{
                                Link("Jared Jewelers", destination: URL(string: "https://www.jared.com/?srsltid=AfmBOoq-h5AqXTmbRy1smdBP-t94h0wi9KT85duGY9O6FwmHzQE-ytSL")!)
                                
                                .onChange(of: Monitor().status){connection in
                                    showNetworkAlert = connection.self.rawValue.isEmpty
                                }
                                
                                
                                .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Jared Jewelers")
                                }) {
                                    Image(systemName: "heart")
                                }

                            }
                        }
                        
                        
                    }
                    .padding(.bottom)
                    Rectangle()
                        .fill(Color.clear)
                    
                    Text ("Clothes")
                        .bold()
                        .frame(width: 200, height:20)
                        .font(.system(size: 20))
                        .padding(.top)
                        .padding(.top)
                    
                    
                    HStack{
                        VStack{
                            Image("forever21")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius:10))
                                .shadow(radius: 10)
                                .padding()
                            HStack{
                                
                                Link("Forever 21", destination: URL(string: "https://www.forever21.com/us/shop/catalog/category/f21/women-new-arrivals-clothing")!)
                                    .onChange(of: Monitor().status){connection in
                                    showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Forever21")
                                }) {
                                    Image(systemName: "heart")
                                }

                            }
                            
                             
                            
                        }
                        VStack{
                            Image("hm")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius: 10))
                                .padding()
                                .shadow(radius: 10)
                            HStack{
                                Link("H&M", destination: URL(string: "https://www2.hm.com/en_us/women.html")!)
                                
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "H&M")
                                }) {
                                    Image(systemName: "heart")
                                }

                            }
                        }
                        VStack{
                            Image("maceys")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .padding()
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 10)
                            HStack{
                                Link("Maceys", destination: URL(string: "https://www.macys.com/shop/womens-clothing?id=118")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Maceys")
                                }) {
                                    Image(systemName: "heart")
                                }

                                
                            }
                            
                            
                        }
                        
                    }
                    .padding(.bottom)
                    Rectangle()
                        .fill(Color.clear)
                    
                    
                    
                    Text ("Shoes")
                        .bold()
                        .frame(width: 200, height:20)
                        .font(.system(size: 20))
                        .padding(.top)
                        .padding(.top)
                    
                    HStack{
                        VStack{
                            Image("converse")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius: 10))
                                .padding()
                                .shadow(radius: 10)
                            HStack{
                                Link("Converse", destination: URL(string: "https://www.converse.com/shop/womens-shoes")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Converse")
                                }) {
                                    Image(systemName: "heart")
                                }

                                
                            }
                        }
                        VStack{
                            Image("nike")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius: 10))
                                .padding()
                                .shadow(radius: 10)
                            HStack{
                                Link("Nike", destination: URL(string: "https://www.nike.com/women")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Nike")
                                }) {
                                    Image(systemName: "heart")
                                }

                                
                            }
                            
                            
                        }
                        VStack{
                            Image("puma")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .padding()
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 10)
                            HStack{
                                Link("Puma", destination: URL(string: "https://us.puma.com/us/en/women/new-arrivals?gad_source=1&gclid=EAIaIQobChMIrOqu_aXwiAMVS0P_AR261AIXEAAYASABEgJ3QfD_BwE")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Puma")
                                }) {
                                    Image(systemName: "heart")
                                }

                                
                            }
                            
                        }
                        
                    }
                    .padding(.bottom)
                    Rectangle()
                        .fill(Color.clear)
                    
                    
                    
                }
                .background(Color(red: 217/100, green: 242/100, blue: 255/100))
            }
            .navigationTitle("Women")
        }
        
    }
    
    }



struct MenView: View {
    @ObservedObject var favoritePages = FavoritePages()
    @State  var showNetworkAlert = true
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Rectangle()
                        .fill(Color.blue)
                    Text ("Trendy. Timeless. Yours")
                        .bold()
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 4/100, green: 18/100, blue: 31/100))
                    Text ("\nRedefine elegance and express yourself ")
                        .font(.system(size: 15))
                        .foregroundColor(Color(red: 4/100, green: 18/100, blue: 31/100))
                        .padding(.bottom)
                    
                    Text ("Accessories")
                        .bold()
                        .frame(width: 200, height:20)
                        .font(.system(size: 20))
                        .padding(.top)
                    
                    
                    HStack{
                        VStack{
                            Image("nordstrom")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 10)
                                .padding()
                            HStack{
                                Link("Nordstrom", destination: URL(string: "https://www.nordstrom.com/browse/men/accessories?srsltid=AfmBOoqQrp0IB-MbWfFoufydnMvUl_b1rkD5KzeBIF32p8POxlwx64a7")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "NordStorm")
                                }) {
                                    Image(systemName: "heart")
                                }
                                
                            }
                        }
                        VStack{
                            Image("taylorstitch")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 10)
                                .padding()
                            HStack{
                                Link("Taylor Stitch", destination: URL(string: "https://www.taylorstitch.com/collections/mens-accessories?srsltid=AfmBOopfi4vJi0qDVkIr-RhGE_lDrunvGyAl__4jlspeoX-uNUdTjOXx")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Taylor Stitch")
                                }) {
                                    Image(systemName: "heart")
                                }
                                
                            }
                            
                        }
                        VStack{
                            Image("asos")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 10)
                                .padding()
                            HStack{
                                Link("ASOS", destination: URL(string: "https://www.asos.com/us/men/accessories/cat/?cid=4210")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "ASOS")
                                }) {
                                    Image(systemName: "heart")
                                }
                                
                            }
                        }
                        
                    }
                    .padding(.bottom)
                    Rectangle()
                        .fill(Color.clear)
                    
                    
                    Text ("Clothes")
                        .bold()
                        .frame(width: 200, height:20)
                        .font(.system(size: 20))
                        .padding(.top)
                        .padding(.top)
                    
                    
                    HStack{
                        VStack{
                            Image("urban")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius:10))
                                .shadow(radius: 10)
                                .padding()
                            HStack{
                                Link("Urban outfitters", destination: URL(string: "https://www.urbanoutfitters.com/mens-clothing")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Urban Outfitters")
                                }) {
                                    Image(systemName: "heart")
                                }
                                
                            }
                            
                        }
                        VStack{
                            Image("hm")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius: 10))
                                .padding()
                                .shadow(radius: 10)
                            HStack{
                                Link("H&M", destination: URL(string: "https://www2.hm.com/en_us/men.html")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                            Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "H&M")
                                }) {
                                    Image(systemName: "heart")
                                }
                                
                            }
                            
                            
                        }
                        VStack{
                            Image("calvin")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .padding()
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 10)
                            
                            HStack{
                                Link("Calvin Klein", destination: URL(string: "https://www.calvinklein.us/en/men")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Calvin Klein")
                                }) {
                                    Image(systemName: "heart")
                                }
                                
                            }
                            
                        }
                        
                    }
                    .padding(.bottom)
                    Rectangle()
                        .fill(Color.clear)
                    
                    
                    
                    Text ("Shoes")
                        .bold()
                        .frame(width: 200, height:20)
                        .font(.system(size: 20))
                        .padding(.top)
                        .padding(.top)
                    
                    HStack{
                        VStack{
                            Image("converse")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius: 10))
                                .padding()
                                .shadow(radius: 10)
                            HStack{
                                Link("Converse", destination: URL(string: "https://www.converse.com/shop/womens-shoes")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Converse")
                                }) {
                                    Image(systemName: "heart")
                                }
                                
                            }
                        }
                        VStack{
                            Image("nike")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius: 10))
                                .padding()
                                .shadow(radius: 10)
                            HStack{
                                Link("Nike", destination: URL(string: "https://www.nike.com/women")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Nike")
                                }) {
                                    Image(systemName: "heart")
                                }
                                
                            }
                            
                        }
                        VStack{
                            Image("puma")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .padding()
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 10)
                            HStack{
                                Link("Puma", destination: URL(string: "https://us.puma.com/us/en/women/new-arrivals?gad_source=1&gclid=EAIaIQobChMIrOqu_aXwiAMVS0P_AR261AIXEAAYASABEgJ3QfD_BwE")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Puma")
                                }) {
                                    Image(systemName: "heart")
                                }
                                
                            }
                            
                        }
                        
                    }
                    .padding(.bottom)
                    Rectangle()
                        .fill(Color.clear)
                    
                    
                    
                }
                .background(Color(red: 217/100, green: 242/100, blue: 255/100))
            }
            .navigationTitle("Men")
        }
    }
    

    }

struct KidsView: View {
    @ObservedObject var favoritePages = FavoritePages()
    @State  var showNetworkAlert = true
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Rectangle()
                        .fill(Color.blue)
                    Text ("Dream. Explore. Imagine")
                        .bold()
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 4/100, green: 18/100, blue: 31/100))
                    Text ("\nRedefine elegance and express yourself ")
                        .font(.system(size: 15))
                        .foregroundColor(Color(red: 4/100, green: 18/100, blue: 31/100))
                        .padding(.bottom)
                    
                    Text ("Toys")
                        .bold()
                        .frame(width: 200, height:20)
                        .font(.system(size: 20))
                        .padding(.top)

                    
                    HStack{
                        VStack{
                            
                            Image("toysrus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 10)
                                .padding()
                            HStack{
                                Link("ToysRUs", destination: URL(string: "https://www.toysrus.com/?srsltid=AfmBOop_PG3wLd3Nx4lulLY9K2JYp7Vzw1bcMaqSXs5kVJRv8l_x86Qz")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "ToysRUs")
                                }) {
                                    Image(systemName: "heart")
                                }
                                
                            }
                        }
                        VStack{
                            Image("lego")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 10)
                                .padding()
                            HStack{
                                Link("Lego", destination: URL(string: "https://www.lego.com/en-us/themes/friends?gclid=EAIaIQobChMI4ZC_-L_yiAMVqUp_AB3c5DDYEAAYASAAEgJcmPD_BwE&ef_id=EAIaIQobChMI4ZC_-L_yiAMVqUp_AB3c5DDYEAAYASAAEgJcmPD_BwE%3AG%3As&s_kwcid=AL%21790%213%21646000408071%21e%21%21g%21%21shopping+toys%2117339728937%21134397122542&cmp=KAC-INI-GOOGUS-GO-US_GL-EN-BR-PS-CONSIDER-BELIEVE-FRIENDS-SHOP-GP-EX-RN-CIDNA00000-FRIENDS_JUMP&gad_source=1")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Lego")
                                }) {
                                    Image(systemName: "heart")
                                }
                            }
                            
                            
                        }
                        VStack{
                            Image("fao")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 10)
                                .padding()
                            HStack{
                                Link("Fao Schwarz", destination: URL(string: "https://faoschwarz.com/?srsltid=AfmBOooYDAd44HiG8TqwIKiElr09Tgyy2nd9UWl_Wk7SbwKhhGr2cVIQ")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Fao Schwarz")
                                }) {
                                    Image(systemName: "heart")
                                }
                            }
                            
                        }
                        
                    }
                    .padding(.bottom)
                    Rectangle()
                        .fill(Color.clear)
                    
                    
                    Text ("Clothes")
                        .bold()
                        .frame(width: 200, height:20)
                        .font(.system(size: 20))
                        .padding(.top)
                        .padding(.top)
                    
                    
                    HStack{
                        VStack{
                            Image("children")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius:10))
                                .shadow(radius: 10)
                                .padding()
                            HStack{
                                Link("The Children's Place", destination: URL(string: "https://www.childrensplace.com/us/home")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "The Children's Place")
                                }) {
                                    Image(systemName: "heart")
                                }
                            }
                            
                        }
                        VStack{
                            Image("hm")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius: 10))
                                .padding()
                                .shadow(radius: 10)
                            HStack{
                                Link("H&M", destination: URL(string: "https://www2.hm.com/en_us/kids/products/clothing.html")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "H&M")
                                }) {
                                    Image(systemName: "heart")
                                }
                            }
                            
                        }
                        VStack{
                            Image("gymboree")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .padding()
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 10)
                            HStack{
                                Link("Gymboree", destination: URL(string: "https://www.gymboree.com/us/home")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Gymboree")
                                }) {
                                    Image(systemName: "heart")
                                }
                            }
                        }
                        
                    }
                    .padding(.bottom)
                    Rectangle()
                        .fill(Color.clear)
                    
                    
                    
                    Text ("Shoes")
                        .bold()
                        .frame(width: 200, height:20)
                        .font(.system(size: 20))
                        .padding(.top)
                        .padding(.top)
                    
                    HStack{
                        VStack{
                            Image("converse")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius: 10))
                                .padding()
                                .shadow(radius: 10)
                            HStack{
                                Link("Converse", destination: URL(string: "https://www.converse.com/shop/kids-shoes")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Converse")
                                }) {
                                    Image(systemName: "heart")
                                }
                            }
                        }
                        
                        VStack{
                            Image("nike")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .clipShape(.rect(cornerRadius: 10))
                                .padding()
                                .shadow(radius: 10)
                            HStack{
                                Link("Nike", destination: URL(string: "https://www.nike.com/w/kids-shoes-v4dhzy7ok")!)
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Nike")
                                }) {
                                    Image(systemName: "heart")
                                }
                            }
                            
                        }
                        VStack{
                            Image("puma")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height:90)
                                .padding()
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 10)
                            HStack{
                                Link("Puma", destination: URL(string: "https://us.puma.com/us/en/kids")!)
                                    .onChange(of: Monitor().status){connection in
                                        showNetworkAlert = connection.self.rawValue.isEmpty
                                    }
                                    .alert ("Network Unavailable", isPresented: $showNetworkAlert){}
                                    .font(.system(size: 15))
                                Button(action: {
                                    FavoritePages.favorite.markAsFavorite(pageTitle: "Puma")
                                }) {
                                    Image(systemName: "heart")
                                }
                            }
                        }
                        
                    }
                    .padding(.bottom)
                    Rectangle()
                        .fill(Color.clear)
                    
                    
                    
                }
                .background(Color(red: 217/100, green: 242/100, blue: 255/100))
            }
            .navigationTitle("Kids")
        }
    }
    

    }

    
    struct KitchenView: View {
        var body: some View {
            NavigationView {
                ScrollView {
                    VStack {
                        
                        Text ("App Version: 1.0\nXcode Ver:16.0\nMacOS: 14.5\n\nDeveloper: Nayab Zahra\nEmail: zahrn29@uwgb.edu")
                            .bold()
                            .font(.system(size: 20))
                            .foregroundColor(Color(red: 4/100, green: 18/100, blue: 31/100))
                            .frame(width: 300, height: 300)
                        
                    }
                    .background(Color(red: 217/100, green: 242/100, blue: 255/100))
                }
                .navigationTitle("About us")
                
                
            }
        }
    }
    
struct FirstAidView: View {
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Rectangle()
                        .fill(Color.blue)
                        Text ("Enter your Log In details")
                            .bold()
                            .font(.system(size: 20))
                            .foregroundColor(Color(red: 4/100, green: 18/100, blue: 31/100))
                        Image("firstaid1")
                            .resizable()
                            .scaledToFit()
                    
                    Button("Log In"){}
                        .buttonStyle(.borderedProminent)

                }
                .background(Color(red: 217/100, green: 242/100, blue: 255/100))
                }
                .navigationTitle("Log In ")
        }
    }
    
}



    struct ContentView: View {
        @EnvironmentObject var router: Router
        @EnvironmentObject var favoritePages: FavoritePages
      
        struct FavoritePagesView: View {
            @ObservedObject var favoritePages = FavoritePages()
            var body: some View {
                NavigationView{
                    ScrollView{
                        Rectangle()
                            .fill(Color.blue)
                        ForEach(FavoritePages.favorite.pages, id: \.self) { pageTitle in
                            HStack{
                                Text(pageTitle)
                                    .bold()
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .frame(alignment: .top).padding()
                                Image(systemName: "heart.fill").padding()
                            }
                        }
                    }
                    .navigationTitle("Favourite Pages")
                }.environmentObject(favoritePages)
            }
        }
     
        
        var body: some View {
            TabView(selection: $router.selectedTab) {
            
                    HomeView()
                        .tabItem {
                            Text ("Welcome")
                            Image (systemName: "light.max")
                        }
                        .tag(0)
                
            
                    TransportationView()
                        .tabItem{
                            Text ("Home")
                            Image (systemName: "house")
                        }
                        .tag(1)
              
           
                WomenView()
                        .tabItem{
                            Text ("Women")
                            Image(systemName: "laurel.leading")
                        }
                        .tag(2)
                        .environmentObject(favoritePages)

                
         
                    MenView()
                        .tabItem{
                            Text ("Men")
                            Image(systemName: "mustache.fill")
                         
                        }
                        .tag(3)
                        .environmentObject(favoritePages)
                    
                KidsView()
                    .environmentObject(favoritePages)
                    .tabItem{
                        Text ("Kids")
                        Image (systemName: "figure.child")
                    }
                    .tag(4)
       
                    KitchenView()
                    .tabItem{
                        Text ("About Us")
                        Image(systemName: "questionmark.circle.fill")
                     
                    }
                    .tag(5)
     
                FavoritePagesView()
                    .environmentObject(favoritePages)
                               .tabItem {
                                   Text ("Favorite Pages")
                                   Image (systemName: "heart")
                               }
                
                               .tag(6)
                
            }
        }
       
    }
    





