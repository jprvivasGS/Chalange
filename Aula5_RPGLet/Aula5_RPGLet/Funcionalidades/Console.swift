import Foundation
import Darwin
class _console{
    static let Intance: _console = _console()
    private init(){}
    func lerInput() -> String{
        if let input = readLine(){
            return input
        }
        exit(0)
    }
    
    func lerInt() -> Int{
        if let int = Int(lerInput()){
            return int
        }
        exit(0)
    }
    
    func lerIntLimitado(min: Int, max: Int) -> Int{
        if let int = Int(lerInput()){
            if max >= int && int >= min{
                return int
            }
            else{
                print("Erro: input fora do escopo!")
                exit(0)
            }
        }else{
            print("Erro: input não válido!")
            exit(0)
        }
    }
    
    func cortarInput() -> [String]{
        let input = lerInput()
        var aryString: [String] = []
        let ary = input.split(separator: ",")
        for itens in ary{
            aryString.append(String(itens))
        }
        return aryString
    }
    
    func limparConsole(){
        for _ in 1...50{
            print("\n")
        }
    }
    
    func dormirConsole(seg: Int) async{
        try? await Task.sleep(nanoseconds: UInt64(seg*1_000_000_000))
    }
}
