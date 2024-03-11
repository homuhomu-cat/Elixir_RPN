defmodule Main do
    # リストの1番目を整数として取得
    def first(list) do
        elem(Integer.parse(hd list), 0)
    end

    # リストの2番目を整数として取得
    def second(list) do
        elem(Integer.parse(hd tl list), 0)
    end

    # 加算
    def add(list) do
        r_list = :lists.reverse(list)
        :lists.reverse([Integer.to_string(second(r_list) + first(r_list))] ++ (tl tl r_list))
    end

    # 減算
    def sub(list) do
        r_list = :lists.reverse(list)
        :lists.reverse([Integer.to_string(second(r_list) - first(r_list))] ++ (tl tl r_list))
    end

    # 乗算
    def mul(list) do
        r_list = :lists.reverse(list)
        :lists.reverse([Integer.to_string(second(r_list) * first(r_list))] ++ (tl tl r_list))
    end

    # 除算
    def div(list) do
        r_list = :lists.reverse(list)
        :lists.reverse([Integer.to_string(second(r_list) / first(r_list))] ++ (tl tl r_list))
    end

    # 計算
    def cal(list, s) do
        if (length s) == 0 do
            elem(Integer.parse(hd list), 0)
        else
            case (hd s) do
                "+" -> cal(add(list), tl s)
                "-" -> cal(sub(list), tl s)
                "*" -> cal(mul(list), tl s)
                "/" -> cal(div(list), tl s)
                _ -> cal(list ++ [hd s], tl s)
            end
        end
    end

    # 計算開始
    def calculate(s) do
        list = []
        cal(list, s)
    end

    def main do
        s = IO.read(:line) |> String.trim() |> String.split(" ")
        IO.puts calculate s
    end
end

Main.main