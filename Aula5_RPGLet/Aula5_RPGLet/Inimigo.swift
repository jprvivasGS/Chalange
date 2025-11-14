import Foundation
class inimigo{
    enum tipo{
        case esqueleto
        case zumbi
        case ratos
        case terrasque
    }
    var espece = tipo.esqueleto
    var vdMax: Int = 0
    var vdAtual: Int = 0
    var dano: Int = 0
    func atacar() -> Int{
        if espece == tipo.esqueleto{
            dano = Int.random(in: 1...10)
            print("\nO inimigo te atacou e te deu \(dano) de dano")
            return dano
        }else if espece == tipo.ratos{
            dano = Int.random(in: 1...50)
            print("\nO inimigo te atacou e te deu \(dano) de dano")
            return dano
        }else if espece == tipo.zumbi{
            dano = Int.random(in: 1...30)
            print("\nO inimigo te atacou e te deu \(dano) de dano")
            return dano
        }else if espece == tipo.terrasque{
            dano = Int.random(in: 1...100)
            print("\nO inimigo te atacou e te deu \(dano) de dano")
            return dano
        }
        return 0
    }
    func definirInimigo(num: Int){
        switch num{
        case 1:
            espece = tipo.ratos
            vdMax = Int.random(in: 1...1000)
            vdAtual = vdMax
        case 2:
            espece = tipo.zumbi
            vdMax = Int.random(in: 1...1000)
            vdAtual = vdMax
        case 3:
            espece = tipo.esqueleto
            vdMax = Int.random(in: 1...1000)
            vdAtual = vdMax
        case 4:
            espece = tipo.terrasque
            vdMax = Int.random(in: 1...1000)
            vdAtual = vdMax
        default:
            espece = tipo.terrasque
            vdMax = Int.random(in: 1...1000)
            vdAtual = vdMax
        }
    }
    func tomarDano(num: Int){
        vdAtual = vdAtual - num
        print("\nO inimigo está com \(vdAtual) de vida")
    }
    init() {
        definirInimigo(num: Int.random(in: 1...4))
    }
}
