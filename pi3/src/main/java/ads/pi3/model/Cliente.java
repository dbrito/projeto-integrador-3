/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ads.pi3.model;

/**
 *
 * @author ninck
 */
    public class Cliente {
    

    //Atributos
    private Integer enabled;
    private Integer id;
    private String nome;
    private String cpf;
    private String endereco;
    private String complemento;
    private String datanascimento;


    
    //Métodos de acesso
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public Integer getEnabled() {
        return enabled;
    }
    public void setEnabled(Integer enabled) {
        this.enabled = enabled;
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCPF() {
        return cpf;
    }

    public void setCPF(String cpf) {
        this.cpf = cpf;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setDataNascimento(String datanascimento) {
        this.datanascimento = datanascimento;
    }

    public String getDataNascimento() {
        return datanascimento;
    }

  
}

   
