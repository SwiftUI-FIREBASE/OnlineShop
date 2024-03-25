//
//  AccountView.swift
//  OnlineShop
//
//  Created by  on 25/3/24.
//

import SwiftUI

struct AccountView: View {
    @State private var showingPopover = false
    @State private var nombre: String = ""
    @State private var apellido: String = ""
    @State private var email: String = ""
    @State private var bir_thday: String = ""
    @State private var vip: Bool = false
    @State private var promotion: Bool = false
   
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Datos personales")){
                    TextField("Nombre", text: $nombre)
                    TextField("Apellidos", text: $apellido)
                    TextField("Email", text: $email)
                    Button("Guardar Cambios") {
                        save()
                    }.popover(isPresented: $showingPopover) {
                        Text("Datos guardados exitosamente")
                            .font(.headline)
                            .padding()
                    }
                    
                }
                
                Section(header: Text("Configuración")){
                    Toggle(isOn: $vip){
                        Text("Cliente Vip")
                    }
                    
                    Toggle(isOn: $promotion){
                        Text("Quieres recibir emails promocionales")
                    }
                }
            }
            .navigationBarTitle("Account", displayMode: .automatic)
            .onAppear{
                self.nombre = UserDefaults.standard.string(forKey: "nombre") ?? ""
                self.apellido = UserDefaults.standard.string(forKey: "apellido") ?? ""
                self.email = UserDefaults.standard.string(forKey: "email") ?? ""
                self.vip = UserDefaults.standard.bool(forKey: "vip")
                self.promotion = UserDefaults.standard.bool(forKey: "promotion")
                
            }
            
        }
        
        
    }
    func save(){
        UserDefaults.standard.set(nombre, forKey: "nombre")
        UserDefaults.standard.set(apellido, forKey: "apellido")
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(vip, forKey: "vip")
        UserDefaults.standard.set(promotion, forKey: "promotion")
        showingPopover = true
        }
    
}

#Preview {
    AccountView()
}
