/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ads.pi3.model;

/**
 *
 * @author dbrito
 */
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Venda {

    //Atributos
    private List<ItemVenda> listaItens = new ArrayList<ItemVenda>();
    private Usuario vendedor;
    private Filial filial;
    private Cliente cliente;
    private Date data;
    private Integer id;
    
    //Métodos de acesso
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    public Usuario getVendedor() {
        return vendedor;
    }

    public void setVendedor(Usuario vendedor) {
        this.vendedor = vendedor;
    }
    
    public Filial getFilial() {
        return filial;
    }

    public void setFilial(Filial filial) {
        this.filial = filial;
    }
    
    public List<ItemVenda> getItens() {
        return listaItens;
    }

    public void addItem(ItemVenda item) {
        listaItens.add(item);
    }
    
    public Double getTotal() {
        double total=0;        
        for (ItemVenda i : listaItens) {
            total += i.getProduto().getPreco() * i.getQuantidade();
        }        
        return total;
    }
          
}