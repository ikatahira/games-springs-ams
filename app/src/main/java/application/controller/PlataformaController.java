package application.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.model.Plataforma;
import application.repository.PlataformaRepository;


@Controller
@RequestMapping("/plataforma")
public class PlataformaController {

    @Autowired
    private PlataformaRepository plataformaRepo;

    @RequestMapping("/list")
    public String listPlataformas(Model ui) {
        ui.addAttribute("plataformas", plataformaRepo.findAll());
        return "plataforma/list"; // Nome da view para listar as plataformas
    }

    @RequestMapping("/insert")
    public String insert(Model ui) {
        return "plataformas/insert"; // Nome da view para o formulário de adição
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestParam("nome")String nome) {
        plataformaRepo.save(plataforma);
        return "redirect:/plataformas/list"; // Redireciona para a lista após adicionar
    }

    @RequestMapping("/update")
    public String update(
        @RequestParam("id") long id,
        Model ui ) {
       
       Optional<Plataforma> plataforma = plataformaRepo.findById(id);
       if(plataforma.isPresente()){
        ui.addAttribute("plataforma", plataforma.get());
        return "plataforma/update";
       }
               

        return "plataformas/update"; // Nome da view para o formulário de edição
    }

    @RequestMapping(value = "/update", merthod = RequestMethod.POST)
    public String update(
        @RequestParam("id") long id,
        @RequestParam("nome") String nome
    ) {

        Optional<Plataforma> plataforma = plataformaRepo.findById(id);

        if(plataforma.isPresente()){
            plataforma.get().setNome(nome);

        plataformaRepo.save(plataforma.get());
         // Redireciona para a lista após atualizar
    }
    return "redirect:/plataformas/list";
    }
    @RequestMapping("/delete")
    public String delete(
        @RequestParam("id") long id,
        Model ui
    ) {
        Plataforma plataforma = plataformaRepo.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("ID de plataforma inválido:" + id));
        plataformaRepo.delete(plataforma);
        return "redirect:/plataformas/list"; // Redireciona para a lista após excluir
    }
}