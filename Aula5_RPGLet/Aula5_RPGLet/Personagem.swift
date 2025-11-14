import Foundation
class personagem{
    enum classes{
        case mago
        case guerreiro
        case ladino
        case druida
    }
    var classe = classes.mago
    var atributos = [Int]()
    var vdMax: Int = 0
    var vdAtual: Int = 0
    var mnMax: Int = 0
    var mnAtual: Int = 0
    var nivel: Int = 0
    var dano: Int = 0
    var nome: String = ""
    var verificacaoCompleta = false
    
    func atribuirClasse(){
        let input = _console.Intance.lerInt()
        switch input{
        case 1:
            print("\nOpa que daora! não sabia que você era um mago")
            //verificacaoCompleta = true
        case 2:
            print("\n Opa que daora! não sabia que você era um guerreiro")
            classe = classes.guerreiro
            //verificacaoCompleta = true
        case 3:
            print("\n Opa que daora! não sabia que você era um ladino")
            classe = classes.ladino
            //verificacaoCompleta = true
        case 4:
            print("\n Opa que daora! não sabia que você era uma druida")
            classe = classes.druida
            //verificacaoCompleta = true
        default:
            print("\n Opa você digitou uma coisa errada tente novamente")
            atribuirClasse()
            //verificacaoCompleta = false
        }
    }
    func rolarDado() -> Int{
        return Int.random(in: -5...10)
    }
    func pegarAtributos(){
        var controlador: Int = 0
        var intTemporario = 0
        for i in 1...6{
            controlador = i
            intTemporario = rolarDado()
            switch controlador{
            case 1:
                print("Sua Força é de: \(intTemporario)")
                atributos.append(intTemporario)
            case 2:
                print("Sua Destreza é de: \(intTemporario)")
                atributos.append(intTemporario)
            case 3:
                print("Sua Sabedoria é de: \(intTemporario)")
                atributos.append(intTemporario)
            case 4:
                print("Sua Intêligencia é de: \(intTemporario)")
                atributos.append(intTemporario)
            case 5:
                print("Sua Constituição é de: \(intTemporario)")
                atributos.append(intTemporario)
            case 6:
                print("Sua Carisma é de: \(intTemporario)")
                atributos.append(intTemporario)
            default:
                pegarAtributos()
            }
        }
    }
    func calcularStatus(){
        if classe == classes.mago{
            
            if atributos[4] <= 0{
                vdMax = nivel * 10
                vdAtual = nivel * 10
            }else{
                vdMax = (nivel + atributos[4]) * 10
                vdAtual = (nivel + atributos[4]) * 10
            }
            if atributos[2] <= 0{
                mnMax = nivel * 100
                mnAtual = nivel * 100
            }else{
                mnMax = (nivel + atributos[2]) * 100
                mnAtual = (nivel + atributos[2]) * 100
            }
        }else if classe == classes.guerreiro{
            
            if atributos[4] <= 0{
                vdMax = nivel * 40
                vdAtual = nivel * 40
            }else{
                vdMax = (nivel + atributos[4]) * 40
                vdAtual = (nivel + atributos[4]) * 40
            }
            if atributos[2] <= 0{
                mnMax = nivel * 50
                mnAtual = nivel * 50
            }else{
                mnMax = (nivel + atributos[2]) * 50
                mnAtual = (nivel + atributos[2]) * 50
            }
        }else if classe == classes.ladino{
            
            if atributos[4] <= 0{
                vdMax = nivel * 20
                vdAtual = nivel * 20
            }else{
                vdMax = (nivel + atributos[4]) * 20
                vdAtual = (nivel + atributos[4]) * 20
            }
            if atributos[2] <= 0{
                mnMax = nivel * 75
                mnAtual = nivel * 75
            }else{
                mnMax = (nivel + atributos[2]) * 75
                mnAtual = (nivel + atributos[2]) * 75
            }
        }else if classe == classes.druida{
            
            if atributos[4] <= 0{
                vdMax = nivel * 10
                vdAtual = nivel * 10
            }else{
                vdMax = (nivel + atributos[4]) * 10
                vdAtual = (nivel + atributos[4]) * 10
            }
            if atributos[2] <= 0{
                mnMax = nivel * 150
                mnAtual = nivel * 150
            }else{
                mnMax = (nivel + atributos[2]) * 150
                mnAtual = (nivel + atributos[2]) * 150
            }
        }
    }
    func atacar() -> Int{
        if 0 >= mnAtual{
            print("Acabou sua mana espere uma rodada para atacar!")
            mnAtual = mnMax
            return 0
        }else{
            if classe == classes.mago{
                if atributos[3] == 0{
                    dano = nivel
                }else{
                    dano = nivel * abs(atributos[3])
                }
                mnAtual = mnAtual - (nivel * 20)
                print("\nVocê atacou o inimigo e deu \(dano) de dano!")
                return dano
            }else if classe == classes.guerreiro{
                if atributos[0] == 0{
                    dano = nivel
                }else{
                    dano = nivel * abs(atributos[0])
                }
                mnAtual = mnAtual - (nivel * 20)
                print("\nVocê atacou o inimigo e deu \(dano) de dano!")
                return dano
            }else  if classe == classes.ladino{
                if atributos[1] == 0{
                    dano = nivel
                }else{
                    dano = nivel * abs(atributos[1])
                }
                mnAtual = mnAtual - (nivel * 20)
                print("\nVocê atacou o inimigo e deu \(dano) de dano!")
                return dano
            }else if classe == classes.druida{
                if atributos[5] == 0{
                    dano = nivel
                }else{
                    dano = nivel * abs(atributos[5])
                }
                mnAtual = mnAtual - (nivel * 20)
                print("\nVocê atacou o inimigo e deu \(dano) de dano!")
                return dano
            }
        }
        return 0
    }
    func tomarDano(damage: Int){
        vdAtual = vdAtual - damage
        print("\nVocê está com \(vdAtual) de vida")
    }
    init() {
        
    }
}
