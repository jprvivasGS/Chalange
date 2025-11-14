import Foundation
class RpgHandler{
    static let Intance: RpgHandler = RpgHandler()
    private init(){}
    let console = _console.Intance
    let boss = inimigo()
    let prs = personagem()
    func iniciarJogo() async{
        print("Olá viajante, tenha cuidado nessas terras profanas.\n")
        await console.dormirConsole(seg: 1)
        print("Os misterios e criaturas mais terriveis podem aparecer e comer suas maçãs.\n")
        await console.dormirConsole(seg: 1)
        print("Você não vai querer que comam suas maçãs vai?????\n")
        await console.dormirConsole(seg: 1)
        print("mas me diga oh aventureiro quem é você?\n")
        await console.dormirConsole(seg: 2)
        console.limparConsole()
        print("Qual seu nome?\n")
        prs.nome = console.lerInput()
        print("\nOlha você é o tal \(prs.nome)\n")
        await console.dormirConsole(seg: 2)
        console.limparConsole()
        print("Qual sua classe?\n")
        print("1 -  Mago ## 2 - Guerreiro ## 3 - Ladino ## 4 - Druida")
        prs.atribuirClasse()
        print("Caraca! você é um \(prs.classe)")
        console.limparConsole()
        print("Vamos ver quais são seus atributos UOU!")
        prs.pegarAtributos()
        await console.dormirConsole(seg: 3)
        console.limparConsole()
        print("Mas para você quão forte estamos falando? Qual seu nível?")
        prs.nivel = console.lerIntLimitado(min: 1, max: 20)
        print("UAU! isso tudo? acho que você está mentindo\n")
        prs.calcularStatus()
        print("Se minhas contas estão certas você deve ter, \(prs.vdMax) de vida e \(prs.mnMax) de mana ")
        await console.dormirConsole(seg: 2)
        console.limparConsole()
        print("Oh não um inimigo a frente cuidadooooooooo!")
        print("Olhe é um \(boss.espece)")
        print("Ele vai te matar, rapido atque ele com toda sua forçaaaaaa!")
        while boss.vdAtual >= 0 || prs.vdAtual >= 0{
                await console.dormirConsole(seg: 1)
                boss.tomarDano(num: prs.atacar())
                await console.dormirConsole(seg: 1)
                prs.tomarDano(damage: boss.atacar())
        }
        if 0 >= prs.vdAtual {
            print("Oh não o monstro matou todo mundo noooooooooo!!!!")
        }else if 0 >= boss.vdAtual{
            print("YESSS GANHAMOS NOSSAS MAÇÃS ESTÃO SALVOS!!!!")
        }
    }
}
