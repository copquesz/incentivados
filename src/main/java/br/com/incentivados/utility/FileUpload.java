package br.com.incentivados.utility;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.Objects;

public class FileUpload implements Serializable {

	private static final long serialVersionUID = 1L;
	private static String REAL_PATH = "";

	public static String upload(HttpServletRequest request, MultipartFile arquivo, String nomeArquivo,
								String url) {

		REAL_PATH = request.getServletContext().getRealPath(url);

		if (!new File(REAL_PATH).exists()) {
			new File(REAL_PATH).mkdirs();
		}

		try {
			String extensao = getExtension(Objects.requireNonNull(arquivo.getOriginalFilename()));
			nomeArquivo += "." + extensao;
			String path = REAL_PATH + "/" + nomeArquivo;
			arquivo.transferTo(new File(path));
			System.out.println("Arquivo salvo no local:\n" + path);
		} catch (IOException e) {
			// TODO: handle exception
		}

		return url + "/" + nomeArquivo;
	}

	public static void deletar(HttpServletRequest request, String path) {
		REAL_PATH = request.getServletContext().getRealPath(path);
		File file = new File(REAL_PATH);
		if (file.exists()) {
			file.delete();
			System.out.println("Arquivo excluído com sucesso: " + REAL_PATH);
		} else {
			System.out.println("Falha ao tentar excluir o arquivo: " + REAL_PATH);
			System.out.println("Arquivo inexistente!");
		}
	}

	private static String  getExtension(String filename){
		if(filename.contains(".")){
			return filename.substring(filename.lastIndexOf(".") + 1);
		}
		return "";
	}

}